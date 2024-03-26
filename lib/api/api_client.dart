import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'api_client_exception.dart';

enum RequestType { mutation, query }

class ApiClient {
  const ApiClient();

  Future<Map<String, dynamic>> query(String query) async {
    try {
      return await _request(query, RequestType.query);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> mutation(String mutation) async {
    try {
      return await _request(mutation, RequestType.mutation);
    } catch (e) {
      rethrow;
    }
  }

  Future _request(String document, RequestType requestType) async {
    try {
      late GraphQLOperation operation;
      if (requestType == RequestType.query) {
        operation = Amplify.API.query(
          request: GraphQLRequest<String>(
            document: document,
          ),
        );
      } else {
        operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(
            document: document,
          ),
        );
      }

      final response = await operation.response;

      if (response.errors.isNotEmpty) {
        safePrint(response.errors);
        throw ApiClientException(response.errors.toString());
      } else {
        final json = jsonDecode(response.data);
        return json;
      }
    } catch (e) {
      rethrow;
    }
  }
}
