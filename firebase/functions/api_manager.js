const axios = require("axios").default;
const qs = require("qs");

async function _initSafepayPaymentCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var price = ffVariables["price"];

  var url = `https://sandbox.api.getsafepay.com/order/payments/v3/`;
  var headers = {
    Authorization: `Bearer 35d5b19a7acec1b416d383d850069f1cb8726f038e05ac23e8cf0c8d81dde928`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "merchant_api_key": "sec_cf9a9c22-e407-40bf-b8eb-95cc44d53bb6",
  "intent": "CYBERSOURCE",
  "mode": "payment",
  "currency": "PKR",
  "amount": ${price}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _createAuthTokenCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }

  var url = `https://sandbox.api.getsafepay.com/client/passport/v1/token`;
  var headers = {
    Authorization: `Bearer 35d5b19a7acec1b416d383d850069f1cb8726f038e05ac23e8cf0c8d81dde928`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    InitSafepayPaymentCall: _initSafepayPaymentCall,
    CreateAuthTokenCall: _createAuthTokenCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
