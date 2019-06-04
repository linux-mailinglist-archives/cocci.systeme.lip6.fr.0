Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BA34292
	for <lists+cocci@lfdr.de>; Tue,  4 Jun 2019 11:03:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5492uHY017967;
	Tue, 4 Jun 2019 11:02:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 483DE7768;
	Tue,  4 Jun 2019 10:55:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1C6DE7759
 for <cocci@systeme.lip6.fr>; Tue,  4 Jun 2019 10:55:30 +0200 (CEST)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x548tHF5017584
 for <cocci@systeme.lip6.fr>; Tue, 4 Jun 2019 10:55:18 +0200 (CEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id C703856D9FFEEB954F33;
 Tue,  4 Jun 2019 16:55:14 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
 by mse-fl1.zte.com.cn with SMTP id x548t4kM041434;
 Tue, 4 Jun 2019 16:55:04 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp02[null]) by mapi (Zmail) with MAPI id mid14;
 Tue, 4 Jun 2019 16:55:04 +0800 (CST)
Date: Tue, 4 Jun 2019 16:55:04 +0800 (CST)
X-Zmail-TransId: 2b045cf631e8804fb11e
X-Mailer: Zmail v1.0
Message-ID: <201906041655048641633@zte.com.cn>
In-Reply-To: <1bc40e20-d4d0-77e6-67d6-2230e8026ef0@web.de>
References: 201906041350002807147@zte.com.cn,
 1bc40e20-d4d0-77e6-67d6-2230e8026ef0@web.de
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <Markus.Elfring@web.de>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl1.zte.com.cn x548t4kM041434
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 04 Jun 2019 11:02:58 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 04 Jun 2019 10:55:18 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: michal.lkml@markovi.net, nicolas.palix@imag.fr, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci]
	=?utf-8?q?Coccinelle=3A_semantic_patch_for_missing_of=5Fn?=
	=?utf-8?q?ode=5Fput?=
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiA+IFdlIGN1cnJlbnRseSB1c2UgdGhlIGZvbGxvd2luZyBPY2FtbCBzY3JpcHQgdG8gYXV0b21h
dGljYWxseQo+ID4gY29sbGVjdCBmdW5jdGlvbnMgdGhhdCBuZWVkIHRvIGJlIGNvbnNpZGVyZWQu
Cj4gPgo+ID4gQGluaXRpYWxpemU6b2NhbWxACj4gPiBAQAo+ID4KPiA+IGxldCByZWxldmFudF9z
dHIgPSAidXNlIG9mX25vZGVfcHV0KCkgb24gaXQgd2hlbiBkb25lIgo+IAo+IEkgc3VnZ2VzdCB0
byByZWNvbnNpZGVyIHRoaXMgc2VhcmNoIHBhdHRlcm4uCj4gCj4gVGhlIG1lbnRpb25lZCB3b3Jk
cyBhcmUgZGlzdHJpYnV0ZWQgb3ZlciB0ZXh0IGxpbmVzIGluIHRoZSBkaXNjdXNzZWQKPiBzb2Z0
d2FyZSBkb2N1bWVudGF0aW9uLgo+IFRodXMgSSBpbWFnaW5lIHRoYXQgYW4gb3RoZXIgZG9jdW1l
bnRhdGlvbiBmb3JtYXQgd291bGQgYmUgc2FmZXIKPiBhbmQgbW9yZSBoZWxwZnVsIGZvciB0aGUg
ZGV0ZXJtaW5hdGlvbiBvZiBhIGNvcnJlc3BvbmRpbmcgQVBJCj4gc3lzdGVtIHByb3BlcnR5LgoK
T3VyIHNjcmlwdCB3aWxsIHJlbW92ZSAnKiAnLCdcIG4nLCdcdCcgYW5kIHNvIG9uIGZyb20gdGhl
IGNvbW1lbnRzIGluIHRoZSBmdW5jdGlvbiBoZWFkZXIKYW5kIHRoZW4gbWVyZ2UgdGhlbSBpbnRv
IG9uZSBsaW5lLCBzbyB3ZSBjYW4gZXhhY3RseSBtYXRjaCB0aGUgdGFyZ2V0IHN0cmluZwondXNl
IG9mX25vZGVfcHV0KCkgb24gaXQgd2hlbiBkb25lICcKCi0tClJlZ2FyZHMsCldlbg==


--=====_003_next=====--

--=====_001_next=====
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--=====_001_next=====--

