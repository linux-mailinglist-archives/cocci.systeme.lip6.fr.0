Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6489B198D0B
	for <lists+cocci@lfdr.de>; Tue, 31 Mar 2020 09:38:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02V7bhKf001275;
	Tue, 31 Mar 2020 09:37:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C1ED37823;
	Tue, 31 Mar 2020 09:37:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 12C31780C
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 09:37:42 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0181.hostedemail.com
 [216.40.44.181])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02V7bcvB011826
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 09:37:40 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 8151618022D1A
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 06:59:27 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id DF8945828;
 Tue, 31 Mar 2020 06:59:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 40, 2.5, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:152:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2734:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3873:3874:4321:5007:6119:7903:10011:10400:10450:10455:10848:11232:11658:11914:12295:12297:12740:12895:13069:13311:13357:13894:14659:19904:19999:21080:21433:21451:21627:30012:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:1:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: pail79_8c28d1f5ae411
X-Filterd-Recvd-Size: 1370
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue, 31 Mar 2020 06:59:23 +0000 (UTC)
Message-ID: <b3c46f05b9341d06ad9f0c04f15918102e938c96.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 30 Mar 2020 23:57:28 -0700
In-Reply-To: <d4d9bd0a-6bbf-3557-0726-e46cde5c8e2e@web.de>
References: <d4d9bd0a-6bbf-3557-0726-e46cde5c8e2e@web.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 31 Mar 2020 09:37:44 +0200 (CEST)
X-Greylist: Delayed for 06:43:19 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Tue, 31 Mar 2020 09:37:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] linux: special logic in repetitive tests
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

T24gVHVlLCAyMDIwLTAzLTMxIGF0IDA4OjI4ICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFRoZXJlIGlzIGEgYmxvY2sgb2YgaWYgdGVzdHMgYWdhaW5zdCB0aGUgc2FtZSB2YXJpYWJs
ZQo+ID4gaW4gaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oIHRoYXQgbGlrZWx5IGlzIGRlZmVjdGl2
ZQo+IAo+IEkgd29uZGVyIGFib3V0IHRoaXMgaW50ZXJwcmV0YXRpb24uCgpXb25kZXIgaGFyZGVy
LgoKSWYgc29tZXRoaW5nIGlzICgmIDMpIGl0IGlzIGFsc28gZWl0aGVyICgmIDIgfHwgJiAxKQpz
byB3aHkgaGF2ZSBib3RoIGJlbG93IHRoZSBmaXJzdCB0ZXN0PwoKPiAqIEhvdyBvZnRlbiB3aWxs
IHRoaXMgaW1wbGVtZW50YXRpb24gZGV0YWlsIHJlYWxseSBiZSBhIOKAnGRlZmVjdOKAnT8KCk1v
ZGVyYXRlbHkgbGlrZWx5LgoKPiAqIFdoZXJlIGRvIHlvdSBzdHVtYmxlIG9uIGRpZmZpY3VsdGll
cyB0byBleHByZXNzIGEgY29ycmVzcG9uZGluZyBzb3VyY2UgY29kZQo+ICAgc2VhcmNoIHBhdHRl
cm4gYnkgdGhlIG1lYW5zIG9mIHRoZSBzZW1hbnRpYyBwYXRjaCBsYW5ndWFnZT8KCiNkZWZpbmVz
LCBzaGlmdHMsIG1hc2tzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczov
L3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
