Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F06B1E9519
	for <lists+cocci@lfdr.de>; Wed, 30 Oct 2019 03:53:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9U2qne4026436;
	Wed, 30 Oct 2019 03:52:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 017C677CC;
	Wed, 30 Oct 2019 03:52:48 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B313E454C
 for <cocci@systeme.lip6.fr>; Wed, 30 Oct 2019 03:52:47 +0100 (CET)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9U2pnIh010630
 for <cocci@systeme.lip6.fr>; Wed, 30 Oct 2019 03:51:49 +0100 (CET)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id CF8FBEED7FEA4ED64C6A;
 Wed, 30 Oct 2019 10:51:48 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x9U2pZDb074519;
 Wed, 30 Oct 2019 10:51:35 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019103010515442-192490 ;
 Wed, 30 Oct 2019 10:51:54 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: Julia.Lawall@lip6.fr
Date: Wed, 30 Oct 2019 10:54:30 +0800
Message-Id: <1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-30 10:51:54,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-30 10:51:38
X-MAIL: mse-fl2.zte.com.cn x9U2pZDb074519
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 30 Oct 2019 03:52:49 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 30 Oct 2019 03:51:50 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        cheng.shengyu@zte.com.cn, zhongshiqi <zhong.shiqi@zte.com.cn>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v5] coccicheck: Support search for SmPL scripts
	within selected directory hierarchy
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

KkFsbG93IGRlZmluaW5nIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSDigJxDT0NDSeKAnSBhcyBh
IGRpcmVjdG9yeSB0byBzZWFyY2gKU21QTCBzY3JpcHRzLgoKKlN0YXJ0IGEgY29ycmVzcG9uZGlu
ZyBmaWxlIGRldGVybWluYXRpb24gaWYgaXQgY29udGFpbnMgYW4gYWNjZXB0YWJsZQpwYXRoLgoK
U2lnbmVkLW9mZi1ieTogemhvbmdzaGlxaSA8emhvbmcuc2hpcWlAenRlLmNvbS5jbj4KLS0tCkNo
YW5nZXMgaW4gdjU6CgkxOnJld3JpdGUgY2hhbmdlIGRlc2NyaXB0aW9uIGFzIGFuIGVudW1lcmF0
aW9uCgpDaGFuZ2VzIGluIHY0OgoJMTpyZXdyaXRlIGNoYW5nZSBkZXNjcmlwdGlvbiBpbiBhbm90
aGVyIHdvcmRpbmcKCkNoYW5nZXMgaW4gdjM6CgkxOnJld3JpdGUgY2hhbmdlIGRlc2NyaXB0aW9u
CgkyOmZpeCBwYXRjaCBzdWJqZWN0CgkzOm1vZGlmeSBjb21taXQgbG9nCgpDaGFuZ2VzIGluIHYy
OgoJMS5maXggcGF0Y2ggc3ViamVjdCBhY2NvcmRpbmcgdG8gdGhlIHJlcGx5IGJ5IE1hcmt1cwoJ
PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4KCTIuY2hhbmdlIGRlc2NyaXB0aW9uIGluIOKAnGltcGVy
YXRpdmUgbW9vZOKAnQogCiBzY3JpcHRzL2NvY2NpY2hlY2sgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpY2hlY2sgYi9z
Y3JpcHRzL2NvY2NpY2hlY2sKaW5kZXggZTA0ZDMyOC4uYTFjNDE5NyAxMDA3NTUKLS0tIGEvc2Ny
aXB0cy9jb2NjaWNoZWNrCisrKyBiL3NjcmlwdHMvY29jY2ljaGVjawpAQCAtMjU3LDYgKzI1Nywx
MCBAQCBpZiBbICIkQ09DQ0kiID0gIiIgXSA7IHRoZW4KICAgICBmb3IgZiBpbiBgZmluZCAkc3Jj
dHJlZS9zY3JpcHRzL2NvY2NpbmVsbGUvIC1uYW1lICcqLmNvY2NpJyAtdHlwZSBmIHwgc29ydGA7
IGRvCiAJY29jY2luZWxsZSAkZgogICAgIGRvbmUKK2VsaWYgWyAtZCAiJENPQ0NJIiBdIDsgdGhl
bgorICAgIGZvciBmIGluIGBmaW5kICRDT0NDSS8gLW5hbWUgJyouY29jY2knIC10eXBlIGYgfCBz
b3J0YDsgZG8KKwljb2NjaW5lbGxlICRmCisgICAgZG9uZQogZWxzZQogICAgIGNvY2NpbmVsbGUg
JENPQ0NJCiBmaQotLSAKMi45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0
cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
