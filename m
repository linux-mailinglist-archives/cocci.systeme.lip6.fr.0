Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D31FEC90
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 09:34:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05I7YNKP027851;
	Thu, 18 Jun 2020 09:34:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 03403402B;
	Thu, 18 Jun 2020 09:34:23 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1F178402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:34:22 +0200 (CEST)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433:0:0:0:2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05I7YLAU029504
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:34:21 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1jlp40-007ZSy-Nw; Thu, 18 Jun 2020 09:34:20 +0200
Message-ID: <462123e6a9e7ec17b983dbb8d6f512280b08f450.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall
 <julia.lawall@inria.fr>
Date: Thu, 18 Jun 2020 09:34:19 +0200
In-Reply-To: <b6ded75b-c4fe-dab6-b50a-d8ce55793b97@web.de>
References: <50990ed6-f5b7-c031-a5df-bdaa6863baa8@web.de>
 <a7de508cf43bb62e47967e927b622656e65662ee.camel@sipsolutions.net>
 <b6ded75b-c4fe-dab6-b50a-d8ce55793b97@web.de>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 09:34:23 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 18 Jun 2020 09:34:21 +0200 (CEST)
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

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDA5OjMzICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+ID4gWW91IHRyaWVkIGl0IG91dCB0byBtb3ZlIHRoZSB2YXJpYWJsZSDigJxiYXLigJ0gd2hp
Y2ggaXMgYW4gYXJyYXkgb2YgdHdvIHBvaW50ZXJzLgo+ID4gCj4gPiBPb3BzLiBJIGp1c3QgbWlz
dHlwZWQgdGhhdCB3aGVuIHRyYW5zY3JpYmluZyBpdCB0byBlbWFpbC4uLiBJdCB3YXMgJ3UxNgo+
ID4gYmFyWzJdOycgaW4gdGhlIG9yaWdpbmFsLgo+IAo+IFRoZSBpbnRlbmRlZCBhYnNlbmNlIG9m
IGFzdGVyaXNrcyBjYW4gbWFrZSB0aGUgY2xhcmlmaWNhdGlvbiBhIGJpdCBlYXNpZXIuCj4gQXJl
IHRoZXJlIHN0aWxsIGFueSBzb2Z0d2FyZSBkZXZlbG9wbWVudCBjaGFsbGVuZ2VzIHRvIGNvbnNp
ZGVyIGZvcgo+IHRoZSBtb3ZlbWVudCBvZiBjb3JyZXNwb25kaW5nIGFycmF5IHNpemVzPwoKV2Vs
bCwgaXQncyBzdXJwcmlzaW5nIHRoYXQgaXQgd2VudCB0aGVyZT8gQW5kIGl0IGRvZXNuJ3QgY29t
cGlsZT8KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8v
c3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
