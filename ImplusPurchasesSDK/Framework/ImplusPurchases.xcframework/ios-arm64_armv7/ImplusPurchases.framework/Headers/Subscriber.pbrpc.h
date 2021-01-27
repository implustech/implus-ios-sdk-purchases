// Code generated by gRPC proto compiler.  DO NOT EDIT!
// source: Subscriber.proto

#import <Foundation/Foundation.h>

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "Subscriber.pbobjc.h"
#endif

#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPCLegacy.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>
#endif

@class GPBEmpty;
@class GetAllProductGroupsResponse;
@class ProductGroup;
@class ProductGroupRequest;
@class ReceiptRequest;
@class Subscriber;
@class SubscriberRequest;
@class UploadUserInfoRequest;

#if !defined(GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO) || !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#if defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS) && GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
  #import <Protobuf/GPBEmpty.pbobjc.h>
#else
  #import "GPBEmpty.pbobjc.h"
#endif
#endif

@class GRPCUnaryProtoCall;
@class GRPCStreamingProtoCall;
@class GRPCCallOptions;
@protocol GRPCProtoResponseHandler;
@class GRPCProtoCall;


NS_ASSUME_NONNULL_BEGIN

@protocol IAPService2 <NSObject>

#pragma mark GetSubscriber(SubscriberRequest) returns (Subscriber)

/**
 * get subscriber by user id and receipt. use user id to get
 * subscriber at first, if not found and provided receipt, will
 * try to get subscriber by receipt(android also use subscription)
 * return NOT_FOUND if not exists 
 */
- (GRPCUnaryProtoCall *)getSubscriberWithMessage:(SubscriberRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark VerifyReceipt(ReceiptRequest) returns (Subscriber)

- (GRPCUnaryProtoCall *)verifyReceiptWithMessage:(ReceiptRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetAllProductGroups(Empty) returns (GetAllProductGroupsResponse)

- (GRPCUnaryProtoCall *)getAllProductGroupsWithMessage:(GPBEmpty *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark GetProductGroup(ProductGroupRequest) returns (ProductGroup)

- (GRPCUnaryProtoCall *)getProductGroupWithMessage:(ProductGroupRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

#pragma mark UploadUserInfo(UploadUserInfoRequest) returns (Empty)

- (GRPCUnaryProtoCall *)uploadUserInfoWithMessage:(UploadUserInfoRequest *)message responseHandler:(id<GRPCProtoResponseHandler>)handler callOptions:(GRPCCallOptions *_Nullable)callOptions;

@end

/**
 * The methods in this protocol belong to a set of old APIs that have been deprecated. They do not
 * recognize call options provided in the initializer. Using the v2 protocol is recommended.
 */
@protocol IAPService <NSObject>

#pragma mark GetSubscriber(SubscriberRequest) returns (Subscriber)

/**
 * get subscriber by user id and receipt. use user id to get
 * subscriber at first, if not found and provided receipt, will
 * try to get subscriber by receipt(android also use subscription)
 * return NOT_FOUND if not exists 
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (void)getSubscriberWithRequest:(SubscriberRequest *)request handler:(void(^)(Subscriber *_Nullable response, NSError *_Nullable error))handler;

/**
 * get subscriber by user id and receipt. use user id to get
 * subscriber at first, if not found and provided receipt, will
 * try to get subscriber by receipt(android also use subscription)
 * return NOT_FOUND if not exists 
 *
 * This method belongs to a set of APIs that have been deprecated. Using the v2 API is recommended.
 */
- (GRPCProtoCall *)RPCToGetSubscriberWithRequest:(SubscriberRequest *)request handler:(void(^)(Subscriber *_Nullable response, NSError *_Nullable error))handler;


#pragma mark VerifyReceipt(ReceiptRequest) returns (Subscriber)

- (void)verifyReceiptWithRequest:(ReceiptRequest *)request handler:(void(^)(Subscriber *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToVerifyReceiptWithRequest:(ReceiptRequest *)request handler:(void(^)(Subscriber *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetAllProductGroups(Empty) returns (GetAllProductGroupsResponse)

- (void)getAllProductGroupsWithRequest:(GPBEmpty *)request handler:(void(^)(GetAllProductGroupsResponse *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToGetAllProductGroupsWithRequest:(GPBEmpty *)request handler:(void(^)(GetAllProductGroupsResponse *_Nullable response, NSError *_Nullable error))handler;


#pragma mark GetProductGroup(ProductGroupRequest) returns (ProductGroup)

- (void)getProductGroupWithRequest:(ProductGroupRequest *)request handler:(void(^)(ProductGroup *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToGetProductGroupWithRequest:(ProductGroupRequest *)request handler:(void(^)(ProductGroup *_Nullable response, NSError *_Nullable error))handler;


#pragma mark UploadUserInfo(UploadUserInfoRequest) returns (Empty)

- (void)uploadUserInfoWithRequest:(UploadUserInfoRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToUploadUserInfoWithRequest:(UploadUserInfoRequest *)request handler:(void(^)(GPBEmpty *_Nullable response, NSError *_Nullable error))handler;


@end


#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface IAPService : GRPCProtoService<IAPService2, IAPService>
- (instancetype)initWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host callOptions:(GRPCCallOptions *_Nullable)callOptions;
// The following methods belong to a set of old APIs that have been deprecated.
- (instancetype)initWithHost:(NSString *)host;
+ (instancetype)serviceWithHost:(NSString *)host;
@end
#endif

NS_ASSUME_NONNULL_END

