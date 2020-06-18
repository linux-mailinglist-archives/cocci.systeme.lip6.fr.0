Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6A1FEC5B
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 09:20:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05I7KT8L000132;
	Thu, 18 Jun 2020 09:20:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 79C09781F;
	Thu, 18 Jun 2020 09:20:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 49834402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:20:28 +0200 (CEST)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433:0:0:0:2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05I7KR2F017832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:20:28 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1jloqY-007ZC6-Dl; Thu, 18 Jun 2020 09:20:26 +0200
Message-ID: <a7de508cf43bb62e47967e927b622656e65662ee.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall
 <julia.lawall@inria.fr>
Date: Thu, 18 Jun 2020 09:20:25 +0200
In-Reply-To: <50990ed6-f5b7-c031-a5df-bdaa6863baa8@web.de>
References: <50990ed6-f5b7-c031-a5df-bdaa6863baa8@web.de>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 09:20:30 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 18 Jun 2020 09:20:28 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] moving variable declarations up
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDA5OjE5ICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+ID4gPiA+ICtUIHg7Cj4gPiA+ID4gCj4gPiA+ID4gQ2hhbmdlIHRoZSArIHRvICsrCj4gPiAK
PiA+IEhlaCwgc29tZXRoaW5nIGZ1bm55IGhhcHBlbmVkCj4gPiAKPiA+ICsgdTE2ICpmb287Cj4g
PiArIHUxNlsyXSBiYXI7Cj4gPiAKPiA+IC4uLiBzb21lIGNvZGUgLi4uCj4gPiAKPiA+IC11MTYg
KmZvbzsKPiA+IC11MTYgKmJhclsyXTsKPiA+IAo+ID4gCj4gPiBXaGF0IGhhcHBlbmVkIHRvIHRo
ZSBhcnJheSBpbmRleD8KPiA+IAo+ID4gSSBndWVzcyAuLi4gYXQgc29tZSBsZXZlbCBJIGV2ZW4g
dW5kZXJzdGFuZCBpdCwgdGhhdCdzIGEgcHJvcGVydHkgb2YgdGhlCj4gPiB0eXBlLCBhbmQgSSB3
YXMgbW92aW5nIHRoZSB0eXBlIGFyb3VuZC4gQnV0IEkgcmVhbGx5IGRpZG4ndCBleHBlY3QgdGhh
dAo+IAo+IEkgZmluZCB0aGF0IHRoZXJlIGFyZSBmdXJ0aGVyIHNvZnR3YXJlIGRldmVsb3BtZW50
IGNoYWxsZW5nZXMgdG8gY2xhcmlmeS4KPiAKPiBZb3UgdHJpZWQgaXQgb3V0IHRvIG1vdmUgdGhl
IHZhcmlhYmxlIOKAnGJhcuKAnSB3aGljaCBpcyBhbiBhcnJheSBvZiB0d28gcG9pbnRlcnMuCgpP
b3BzLiBJIGp1c3QgbWlzdHlwZWQgdGhhdCB3aGVuIHRyYW5zY3JpYmluZyBpdCB0byBlbWFpbC4u
LiBJdCB3YXMgJ3UxNgpiYXJbMl07JyBpbiB0aGUgb3JpZ2luYWwuCgpqb2hhbm5lcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBs
aXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFu
L2xpc3RpbmZvL2NvY2NpCg==
