/*
 * Copyright 2017, Google Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * EDITING INSTRUCTIONS
 * This file was generated from the file
 * https://github.com/googleapis/googleapis/blob/master/src/proto/grpc/testing/services.proto,
 * and updates to that file get reflected here through a refresh process.
 * For the short term, the refresh process will only be runnable by Google
 * engineers.
 *
 * The only allowed edits are to method and file documentation. A 3-way
 * merge preserves those additions if the generated source changes.
 */
/* TODO: introduce line-wrapping so that it never exceeds the limit. */
/* jscs: disable maximumLineLength */
'use strict';

var configData = require('./benchmark_service_client_config');
var extend = require('extend');
var gax = require('google-gax');

var SERVICE_ADDRESS = 'testing.googleapis.com';

var DEFAULT_SERVICE_PORT = 443;

var CODE_GEN_NAME_VERSION = 'gapic/0.7.1';

var STREAM_DESCRIPTORS = {
  streamingCall: new gax.StreamDescriptor(gax.StreamType.BIDI_STREAMING),
  streamingFromClient: new gax.StreamDescriptor(gax.StreamType.CLIENT_STREAMING),
  streamingFromServer: new gax.StreamDescriptor(gax.StreamType.SERVER_STREAMING),
  streamingBothWays: new gax.StreamDescriptor(gax.StreamType.BIDI_STREAMING)
};

/**
 * The scopes needed to make gRPC calls to all of the methods defined in
 * this service.
 */
var ALL_SCOPES = [
  'https://www.googleapis.com/auth/cloud-platform',
  'https://www.googleapis.com/auth/pubsub'
];

/**
 *
 * @class
 */
function BenchmarkServiceClient(gaxGrpc, grpcClients, opts) {
  opts = extend({
    servicePath: SERVICE_ADDRESS,
    port: DEFAULT_SERVICE_PORT,
    clientConfig: {}
  }, opts);

  var googleApiClient = [
    'gl-node/' + process.versions.node
  ];
  if (opts.libName && opts.libVersion) {
    googleApiClient.push(opts.libName + '/' + opts.libVersion);
  }
  googleApiClient.push(
    CODE_GEN_NAME_VERSION,
    'gax/' + gax.version,
    'grpc/' + gaxGrpc.grpcVersion
  );

  var defaults = gaxGrpc.constructSettings(
      'grpc.testing.BenchmarkService',
      configData,
      opts.clientConfig,
      {'x-goog-api-client': googleApiClient.join(' ')});

  var self = this;

  this.auth = gaxGrpc.auth;
  var benchmarkServiceStub = gaxGrpc.createStub(
      grpcClients.grpc.testing.BenchmarkService,
      opts);
  this.stubPromise = benchmarkServiceStub;
  var benchmarkServiceStubMethods = [
    'unaryCall',
    'streamingCall',
    'streamingFromClient',
    'streamingFromServer',
    'streamingBothWays'
  ];
  benchmarkServiceStubMethods.forEach(function(methodName) {
    self['_' + methodName] = gax.createApiCall(
      benchmarkServiceStub.then(function(benchmarkServiceStub) {
        return function() {
          var args = Array.prototype.slice.call(arguments, 0);
          return benchmarkServiceStub[methodName].apply(benchmarkServiceStub, args);
        };
      }),
      defaults[methodName],
      STREAM_DESCRIPTORS[methodName]);
  });
}


/**
 * Get the project ID used by this class.
 * @param {function(Error, string)} callback - the callback to be called with
 *   the current project Id.
 */
BenchmarkServiceClient.prototype.getProjectId = function(callback) {
  return this.auth.getProjectId(callback);
};

// Service calls

/**
 * One request followed by one response.
 * The server returns the client payload as-is.
 *
 * @param {Object} request
 *   The request object that will be sent.
 * @param {number=} request.responseType
 *   DEPRECATED, don't use. To be removed shortly.
 *   Desired payload type in the response from the server.
 *   If response_type is RANDOM, server randomly chooses one from other formats.
 *
 *   The number should be among the values of [PayloadType]{@link PayloadType}
 * @param {number=} request.responseSize
 *   Desired payload size in the response from the server.
 * @param {Object=} request.payload
 *   Optional input payload sent along with the request.
 *
 *   This object should have the same structure as [Payload]{@link Payload}
 * @param {boolean=} request.fillUsername
 *   Whether SimpleResponse should include username.
 * @param {boolean=} request.fillOauthScope
 *   Whether SimpleResponse should include OAuth scope.
 * @param {Object=} request.responseCompressed
 *   Whether to request the server to compress the response. This field is
 *   "nullable" in order to interoperate seamlessly with clients not able to
 *   implement the full compression tests by introspecting the call to verify
 *   the response's compression status.
 *
 *   This object should have the same structure as [BoolValue]{@link BoolValue}
 * @param {Object=} request.responseStatus
 *   Whether server should return a given status
 *
 *   This object should have the same structure as [EchoStatus]{@link EchoStatus}
 * @param {Object=} request.expectCompressed
 *   Whether the server should expect this request to be compressed.
 *
 *   This object should have the same structure as [BoolValue]{@link BoolValue}
 * @param {Object=} options
 *   Optional parameters. You can override the default settings for this call, e.g, timeout,
 *   retries, paginations, etc. See [gax.CallOptions]{@link https://googleapis.github.io/gax-nodejs/global.html#CallOptions} for the details.
 * @param {function(?Error, ?Object)=} callback
 *   The function which will be called with the result of the API call.
 *
 *   The second parameter to the callback is an object representing [SimpleResponse]{@link SimpleResponse}.
 * @return {Promise} - The promise which resolves to an array.
 *   The first element of the array is an object representing [SimpleResponse]{@link SimpleResponse}.
 *   The promise has a method named "cancel" which cancels the ongoing API call.
 *
 * @example
 *
 * var  = require('');
 *
 * var client = ({
 *    // optional auth parameters.
 * });
 *
 *
 * client.unaryCall({}).then(function(responses) {
 *     var response = responses[0];
 *     // doThingsWith(response)
 * })
 * .catch(function(err) {
 *     console.error(err);
 * });
 */
BenchmarkServiceClient.prototype.unaryCall = function(request, options, callback) {
  if (options instanceof Function && callback === undefined) {
    callback = options;
    options = {};
  }
  if (options === undefined) {
    options = {};
  }

  return this._unaryCall(request, options, callback);
};

/**
 * Repeated sequence of one request followed by one response.
 * Should be called streaming ping-pong
 * The server returns the client payload as-is on each response
 *
 * @param {Object=} options
 *   Optional parameters. You can override the default settings for this call, e.g, timeout,
 *   retries, paginations, etc. See [gax.CallOptions]{@link https://googleapis.github.io/gax-nodejs/global.html#CallOptions} for the details.
 * @returns {Stream}
 *   An object stream which is both readable and writable. It accepts objects
 *   representing [SimpleRequest]{@link SimpleRequest} for write() method, and
 *   will emit objects representing [SimpleResponse]{@link SimpleResponse} on 'data' event asynchronously.
 *
 * @example
 *
 * var  = require('');
 *
 * var client = ({
 *    // optional auth parameters.
 * });
 *
 * var stream = client.streamingCall().on('data', function(response) {
 *     // doThingsWith(response)
 * });
 * var request = {};
 * // Write request objects.
 * stream.write(request);
 */
BenchmarkServiceClient.prototype.streamingCall = function(options) {
  if (options === undefined) {
    options = {};
  }

  return this._streamingCall(options);
};

/**
 * Single-sided unbounded streaming from client to server
 * The server returns the client payload as-is once the client does WritesDone
 *
 * @param {Object=} options
 *   Optional parameters. You can override the default settings for this call, e.g, timeout,
 *   retries, paginations, etc. See [gax.CallOptions]{@link https://googleapis.github.io/gax-nodejs/global.html#CallOptions} for the details.
 * @param {function(?Error, ?Object)=} callback
 *   The function which will be called with the result of the API call.
 *
 *   The second parameter to the callback is an object representing [SimpleResponse]{@link SimpleResponse}.
 * @return {Stream} - A writable stream which accepts objects representing
 *   [SimpleRequest]{@link SimpleRequest} for write() method.
 *
 * @example
 *
 * var  = require('');
 *
 * var client = ({
 *    // optional auth parameters.
 * });
 *
 * var stream = client.streamingFromClient(function(err, response) {
 *     if (err) {
 *         console.error(err);
 *         return;
 *     }
 *     // doThingsWith(response)
 * });
 * var request = {};
 * // Write request objects.
 * stream.write(request);
 */
BenchmarkServiceClient.prototype.streamingFromClient = function(options, callback) {
  if (options instanceof Function && callback === undefined) {
    callback = options;
    options = {};
  }
  if (options === undefined) {
    options = {};
  }

  return this._streamingFromClient(options, callback);
};

/**
 * Single-sided unbounded streaming from server to client
 * The server repeatedly returns the client payload as-is
 *
 * @param {Object} request
 *   The request object that will be sent.
 * @param {number=} request.responseType
 *   DEPRECATED, don't use. To be removed shortly.
 *   Desired payload type in the response from the server.
 *   If response_type is RANDOM, server randomly chooses one from other formats.
 *
 *   The number should be among the values of [PayloadType]{@link PayloadType}
 * @param {number=} request.responseSize
 *   Desired payload size in the response from the server.
 * @param {Object=} request.payload
 *   Optional input payload sent along with the request.
 *
 *   This object should have the same structure as [Payload]{@link Payload}
 * @param {boolean=} request.fillUsername
 *   Whether SimpleResponse should include username.
 * @param {boolean=} request.fillOauthScope
 *   Whether SimpleResponse should include OAuth scope.
 * @param {Object=} request.responseCompressed
 *   Whether to request the server to compress the response. This field is
 *   "nullable" in order to interoperate seamlessly with clients not able to
 *   implement the full compression tests by introspecting the call to verify
 *   the response's compression status.
 *
 *   This object should have the same structure as [BoolValue]{@link BoolValue}
 * @param {Object=} request.responseStatus
 *   Whether server should return a given status
 *
 *   This object should have the same structure as [EchoStatus]{@link EchoStatus}
 * @param {Object=} request.expectCompressed
 *   Whether the server should expect this request to be compressed.
 *
 *   This object should have the same structure as [BoolValue]{@link BoolValue}
 * @param {Object=} options
 *   Optional parameters. You can override the default settings for this call, e.g, timeout,
 *   retries, paginations, etc. See [gax.CallOptions]{@link https://googleapis.github.io/gax-nodejs/global.html#CallOptions} for the details.
 * @returns {Stream}
 *   An object stream which emits [SimpleResponse]{@link SimpleResponse} on 'data' event.
 *
 * @example
 *
 * var  = require('');
 *
 * var client = ({
 *    // optional auth parameters.
 * });
 *
 *
 * client.streamingFromServer({}).on('data', function(response) {
 *   // doThingsWith(response)
 * });
 */
BenchmarkServiceClient.prototype.streamingFromServer = function(request, options) {
  if (options === undefined) {
    options = {};
  }

  return this._streamingFromServer(request, options);
};

/**
 * Two-sided unbounded streaming between server to client
 * Both sides send the content of their own choice to the other
 *
 * @param {Object=} options
 *   Optional parameters. You can override the default settings for this call, e.g, timeout,
 *   retries, paginations, etc. See [gax.CallOptions]{@link https://googleapis.github.io/gax-nodejs/global.html#CallOptions} for the details.
 * @returns {Stream}
 *   An object stream which is both readable and writable. It accepts objects
 *   representing [SimpleRequest]{@link SimpleRequest} for write() method, and
 *   will emit objects representing [SimpleResponse]{@link SimpleResponse} on 'data' event asynchronously.
 *
 * @example
 *
 * var  = require('');
 *
 * var client = ({
 *    // optional auth parameters.
 * });
 *
 * var stream = client.streamingBothWays().on('data', function(response) {
 *     // doThingsWith(response)
 * });
 * var request = {};
 * // Write request objects.
 * stream.write(request);
 */
BenchmarkServiceClient.prototype.streamingBothWays = function(options) {
  if (options === undefined) {
    options = {};
  }

  return this._streamingBothWays(options);
};

function BenchmarkServiceClientBuilder(gaxGrpc) {
  if (!(this instanceof BenchmarkServiceClientBuilder)) {
    return new BenchmarkServiceClientBuilder(gaxGrpc);
  }

  var benchmarkServiceClient = gaxGrpc.load([{
    root: require('path').join(__dirname, '..', '..', '..', '..', '..'),
    file: 'src/proto/grpc/testing/services.proto'
  }]);
  extend(this, benchmarkServiceClient.grpc.testing);


  /**
   * Build a new instance of {@link BenchmarkServiceClient}.
   *
   * @param {Object=} opts - The optional parameters.
   * @param {String=} opts.servicePath
   *   The domain name of the API remote host.
   * @param {number=} opts.port
   *   The port on which to connect to the remote host.
   * @param {grpc.ClientCredentials=} opts.sslCreds
   *   A ClientCredentials for use with an SSL-enabled channel.
   * @param {Object=} opts.clientConfig
   *   The customized config to build the call settings. See
   *   {@link gax.constructSettings} for the format.
   */
  this.benchmarkServiceClient = function(opts) {
    return new BenchmarkServiceClient(gaxGrpc, benchmarkServiceClient, opts);
  };
  extend(this.benchmarkServiceClient, BenchmarkServiceClient);
}
module.exports = BenchmarkServiceClientBuilder;
module.exports.SERVICE_ADDRESS = SERVICE_ADDRESS;
module.exports.ALL_SCOPES = ALL_SCOPES;
