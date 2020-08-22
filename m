Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76E24E59E
	for <lists+cocci@lfdr.de>; Sat, 22 Aug 2020 07:46:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07M5jnOu021164;
	Sat, 22 Aug 2020 07:45:50 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D6BA977BC;
	Sat, 22 Aug 2020 07:45:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CA89C3F6C
 for <cocci@systeme.lip6.fr>; Sat, 22 Aug 2020 07:45:47 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0218.hostedemail.com
 [216.40.44.218])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07M5jkCJ021629
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 22 Aug 2020 07:45:47 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 65DC48124345
 for <cocci@systeme.lip6.fr>; Sat, 22 Aug 2020 05:30:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 407F4182CED28;
 Sat, 22 Aug 2020 05:30:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:152:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2693:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:5007:7903:10004:10400:10471:10848:10967:11232:11658:11914:12295:12297:12740:12895:13069:13255:13311:13357:13894:14096:14097:14659:14721:21080:21433:21627:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: cover17_5f1646f2703f
X-Filterd-Recvd-Size: 2530
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Aug 2020 05:30:22 +0000 (UTC)
Message-ID: <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Date: Fri, 21 Aug 2020 22:30:21 -0700
In-Reply-To: <162653.1598067338@turing-police>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 22 Aug 2020 07:45:51 +0200 (CEST)
X-Greylist: Delayed for 49:52:26 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Sat, 22 Aug 2020 07:45:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re:
 [PATCH] checkpatch: Add test for comma use that should be semicolon)
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

T24gRnJpLCAyMDIwLTA4LTIxIGF0IDIzOjM1IC0wNDAwLCBWYWxkaXMgS2zEk3RuaWVrcyB3cm90
ZToKPiBPbiBGcmksIDIxIEF1ZyAyMDIwIDE4OjA4OjA4IC0wNzAwLCBKb2UgUGVyY2hlcyBzYWlk
Ogo+ID4gKGZvcndhcmRpbmcgb24gdG8ga2VybmVsLWphbml0b3JzL21lbnRlZXMgYW5kIGtlcm5l
bG5ld2JpZXMpCj4gPiAKPiA+IEp1c3QgZnlpIGZvciBhbnlvbmUgdGhhdCBjYXJlczoKPiA+IAo+
ID4gQSBqYW5pdG9yaWFsIHRhc2sgZm9yIHNvbWVvbmUgbWlnaHQgYmUgdG8gdXNlIEp1bGlhJ3Mg
Y29jY2luZWxsZQo+ID4gc2NyaXB0IGJlbG93IHRvIGNvbnZlcnQgdGhlIGV4aXN0aW5nIGluc3Rh
bmNlcyBvZiBjb21tYXMgdGhhdAo+ID4gc2VwYXJhdGUgc3RhdGVtZW50cyBpbnRvIHNlbWljb2xv
bnMuCj4gCj4gTm90ZSB0aGF0IHlvdSBuZWVkIHRvICpyZWFsbHkqIGNoZWNrIGZvciBwb3NzaWJs
ZSBjaGFuZ2VzIGluIHNlbWFudGljcy4KPiBJdCdzICp1c3VhbGx5KiBPSyB0byBkbyB0aGF0LCBi
dXQgc29tZXRpbWVzIGl0J3Mgbm90Li4uCj4gCj4gZm9yIChpPTA7IGkrKywgbGFzdCsrOyAhbGFz
dCkgewo+IAo+IGNoYW5naW5nIHRoYXQgY29tbWEgdG8gYSA7IHdpbGwgYnJlYWsgdGhlIGNvbXBp
bGUuICBJbiBvdGhlciBjYXNlcywgaXQgY2FuCj4gaW50cm9kdWNlIHN1YnRsZSBidWdzLgoKVHJ1
ZSBlbm91Z2ggZm9yIGEgZ2VuZXJhbCBzdGF0ZW1lbnQsIHRob3VnaCB0aGUgY29jY2luZWxsZQpz
Y3JpcHQgSnVsaWEgcHJvdmlkZWQgZG9lcyBub3QgY2hhbmdlIGEgc2luZ2xlIGluc3RhbmNlIG9m
CmZvciBsb29wIGV4cHJlc3Npb25zIHdpdGggY29tbWFzLgoKQXMgZmFyIGFzIEkgY2FuIHRlbGws
IG5vIGxvZ2ljIGRlZmVjdCBpcyBpbnRyb2R1Y2VkIGJ5IHRoZQpzY3JpcHQgYXQgYWxsLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxp
bmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFp
bG1hbi9saXN0aW5mby9jb2NjaQo=
