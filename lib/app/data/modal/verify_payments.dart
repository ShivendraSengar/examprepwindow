// To parse this JSON data, do
//
//     final verifypayments = verifypaymentsFromJson(jsonString);

import 'dart:convert';

Verifypayments verifypaymentsFromJson(String str) =>
    Verifypayments.fromJson(json.decode(str));

String verifypaymentsToJson(Verifypayments data) => json.encode(data.toJson());

class Verifypayments {
  int? code;
  bool? success;
  String? message;
  Data? data;

  Verifypayments({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory Verifypayments.fromJson(Map<String, dynamic> json) => Verifypayments(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? entity;
  int? amount;
  String? currency;
  String? status;
  String? orderId;
  dynamic invoiceId;
  bool? international;
  String? method;
  int? amountRefunded;
  dynamic refundStatus;
  bool? captured;
  String? description;
  dynamic cardId;
  dynamic bank;
  dynamic wallet;
  String? vpa;
  String? email;
  String? contact;
  Notes? notes;
  int? fee;
  int? tax;
  dynamic errorCode;
  dynamic errorDescription;
  dynamic errorSource;
  dynamic errorStep;
  dynamic errorReason;
  AcquirerData? acquirerData;
  int? createdAt;
  dynamic provider;
  Upi? upi;

  Data({
    this.id,
    this.entity,
    this.amount,
    this.currency,
    this.status,
    this.orderId,
    this.invoiceId,
    this.international,
    this.method,
    this.amountRefunded,
    this.refundStatus,
    this.captured,
    this.description,
    this.cardId,
    this.bank,
    this.wallet,
    this.vpa,
    this.email,
    this.contact,
    this.notes,
    this.fee,
    this.tax,
    this.errorCode,
    this.errorDescription,
    this.errorSource,
    this.errorStep,
    this.errorReason,
    this.acquirerData,
    this.createdAt,
    this.provider,
    this.upi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        currency: json["currency"],
        status: json["status"],
        orderId: json["order_id"],
        invoiceId: json["invoice_id"],
        international: json["international"],
        method: json["method"],
        amountRefunded: json["amount_refunded"],
        refundStatus: json["refund_status"],
        captured: json["captured"],
        description: json["description"],
        cardId: json["card_id"],
        bank: json["bank"],
        wallet: json["wallet"],
        vpa: json["vpa"],
        email: json["email"],
        contact: json["contact"],
        notes: json["notes"] == null ? null : Notes.fromJson(json["notes"]),
        fee: json["fee"],
        tax: json["tax"],
        errorCode: json["error_code"],
        errorDescription: json["error_description"],
        errorSource: json["error_source"],
        errorStep: json["error_step"],
        errorReason: json["error_reason"],
        acquirerData: json["acquirer_data"] == null
            ? null
            : AcquirerData.fromJson(json["acquirer_data"]),
        createdAt: json["created_at"],
        provider: json["provider"],
        upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "currency": currency,
        "status": status,
        "order_id": orderId,
        "invoice_id": invoiceId,
        "international": international,
        "method": method,
        "amount_refunded": amountRefunded,
        "refund_status": refundStatus,
        "captured": captured,
        "description": description,
        "card_id": cardId,
        "bank": bank,
        "wallet": wallet,
        "vpa": vpa,
        "email": email,
        "contact": contact,
        "notes": notes?.toJson(),
        "fee": fee,
        "tax": tax,
        "error_code": errorCode,
        "error_description": errorDescription,
        "error_source": errorSource,
        "error_step": errorStep,
        "error_reason": errorReason,
        "acquirer_data": acquirerData?.toJson(),
        "created_at": createdAt,
        "provider": provider,
        "upi": upi?.toJson(),
      };
}

class AcquirerData {
  String? rrn;

  AcquirerData({
    this.rrn,
  });

  factory AcquirerData.fromJson(Map<String, dynamic> json) => AcquirerData(
        rrn: json["rrn"],
      );

  Map<String, dynamic> toJson() => {
        "rrn": rrn,
      };
}

class Notes {
  String? the0;
  String? the1;
  String? the2;
  String? the3;
  String? the4;
  String? the5;
  String? the6;
  String? the7;
  String? the8;
  String? the9;
  String? the10;
  String? the11;
  String? the12;
  String? the13;
  String? the14;

  Notes({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
    this.the11,
    this.the12,
    this.the13,
    this.the14,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        the8: json["8"],
        the9: json["9"],
        the10: json["10"],
        the11: json["11"],
        the12: json["12"],
        the13: json["13"],
        the14: json["14"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "7": the7,
        "8": the8,
        "9": the9,
        "10": the10,
        "11": the11,
        "12": the12,
        "13": the13,
        "14": the14,
      };
}

class Upi {
  String? payerAccountType;
  String? vpa;

  Upi({
    this.payerAccountType,
    this.vpa,
  });

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        payerAccountType: json["payer_account_type"],
        vpa: json["vpa"],
      );

  Map<String, dynamic> toJson() => {
        "payer_account_type": payerAccountType,
        "vpa": vpa,
      };
}
