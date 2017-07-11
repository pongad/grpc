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
 */
'use strict';

var assert = require('assert');
var  = require('../src');
var through2 = require('through2');

var FAKE_STATUS_CODE = 1;
var error = new Error();
error.code = FAKE_STATUS_CODE;

describe('BenchmarkServiceClient', function() {
  describe('unaryCall', function() {
    it('invokes unaryCall without error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock response
      var username = 'username-265713450';
      var oauthScope = 'oauthScope443818668';
      var expectedResponse = {
          username : username,
          oauthScope : oauthScope
      };

      // Mock Grpc layer
      client._unaryCall = mockSimpleGrpcMethod(request, expectedResponse);

      client.unaryCall(request, function(err, response) {
        assert.ifError(err);
        assert.deepStrictEqual(response, expectedResponse);
        done();
      });
    });

    it('invokes unaryCall with error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock Grpc layer
      client._unaryCall = mockSimpleGrpcMethod(request, null, error);

      client.unaryCall(request, function(err, response) {
        assert(err instanceof Error);
        assert.equal(err.code, FAKE_STATUS_CODE);
        done();
      });
    });
  });

  describe('streamingCall', function() {
    it('invokes streamingCall without error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock response
      var username = 'username-265713450';
      var oauthScope = 'oauthScope443818668';
      var expectedResponse = {
          username : username,
          oauthScope : oauthScope
      };

      // Mock Grpc layer
      client._streamingCall = mockBidiStreamingGrpcMethod(request, expectedResponse);

      var stream = client.streamingCall().on('data', function(response) {
        assert.deepStrictEqual(response, expectedResponse);
        done()
      }).on('error', function(err) {
        done(err);
      });

      stream.write(request);
    });

    it('invokes streamingCall with error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock Grpc layer
      client._streamingCall = mockBidiStreamingGrpcMethod(request, null, error);

      var stream = client.streamingCall().on('data', function(response) {
        assert.fail();
      }).on('error', function(err) {
        assert(err instanceof Error);
        assert.equal(err.code, FAKE_STATUS_CODE);
        done();
      });

      stream.write(request);
    });
  });

  describe('streamingFromServer', function() {
    it('invokes streamingFromServer without error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock response
      var username = 'username-265713450';
      var oauthScope = 'oauthScope443818668';
      var expectedResponse = {
          username : username,
          oauthScope : oauthScope
      };

      // Mock Grpc layer
      client._streamingFromServer = mockServerStreamingGrpcMethod(request, expectedResponse);

      client.streamingFromServer(request).on('data', function(response) {
        assert.deepStrictEqual(response, expectedResponse);
        done()
      }).on('error', function(err) {
        done(err);
      });
    });

    it('invokes streamingFromServer with error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock Grpc layer
      client._streamingFromServer = mockServerStreamingGrpcMethod(request, null, error);

      client.streamingFromServer(request).on('data', function(response) {
        assert.fail();
      }).on('error', function(err) {
        assert(err instanceof Error);
        assert.equal(err.code, FAKE_STATUS_CODE);
        done();
      });
    });
  });

  describe('streamingBothWays', function() {
    it('invokes streamingBothWays without error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock response
      var username = 'username-265713450';
      var oauthScope = 'oauthScope443818668';
      var expectedResponse = {
          username : username,
          oauthScope : oauthScope
      };

      // Mock Grpc layer
      client._streamingBothWays = mockBidiStreamingGrpcMethod(request, expectedResponse);

      var stream = client.streamingBothWays().on('data', function(response) {
        assert.deepStrictEqual(response, expectedResponse);
        done()
      }).on('error', function(err) {
        done(err);
      });

      stream.write(request);
    });

    it('invokes streamingBothWays with error', function(done) {
      var client = ();

      // Mock request
      var request = {};

      // Mock Grpc layer
      client._streamingBothWays = mockBidiStreamingGrpcMethod(request, null, error);

      var stream = client.streamingBothWays().on('data', function(response) {
        assert.fail();
      }).on('error', function(err) {
        assert(err instanceof Error);
        assert.equal(err.code, FAKE_STATUS_CODE);
        done();
      });

      stream.write(request);
    });
  });

});

function mockSimpleGrpcMethod(expectedRequest, response, error) {
  return function(actualRequest, options, callback) {
    assert.deepStrictEqual(actualRequest, expectedRequest);
    if (error) {
      callback(error);
    } else if (response) {
      callback(null, response);
    } else {
      callback(null);
    }
  };
}

function mockServerStreamingGrpcMethod(expectedRequest, response, error) {
  return function(actualRequest) {
    assert.deepStrictEqual(actualRequest, expectedRequest);
    var mockStream = through2.obj(function (chunk, enc, callback) {
      if (error) {
        callback(error);
      } else {
        callback(null, response);
      }
    });
    mockStream.write();
    return mockStream;
  };
}

function mockBidiStreamingGrpcMethod(expectedRequest, response, error) {
  return function() {
    var mockStream = through2.obj(function (chunk, enc, callback) {
      assert.deepStrictEqual(chunk, expectedRequest);
      if (error) {
        callback(error);
      } else {
        callback(null, response);
      }
    });
    return mockStream;
  }
}
