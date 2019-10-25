Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB1E40ED
	for <lists+cocci@lfdr.de>; Fri, 25 Oct 2019 03:18:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9P1Hm4t013132;
	Fri, 25 Oct 2019 03:17:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0659B77CB;
	Fri, 25 Oct 2019 03:17:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 134C677BB
 for <cocci@systeme.lip6.fr>; Fri, 25 Oct 2019 03:17:46 +0200 (CEST)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9P1HhOh019023
 for <cocci@systeme.lip6.fr>; Fri, 25 Oct 2019 03:17:44 +0200 (CEST)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id BC3DD28BE11A04C8D11B;
 Fri, 25 Oct 2019 09:17:40 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x9P1HJub089559;
 Fri, 25 Oct 2019 09:17:19 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102509175316-119804 ;
 Fri, 25 Oct 2019 09:17:53 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: Julia.Lawall@lip6.fr
Date: Fri, 25 Oct 2019 09:19:34 +0800
Message-Id: <1571966374-42566-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-25 09:17:53,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-25 09:17:24
X-MAIL: mse-fl2.zte.com.cn x9P1HJub089559
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 25 Oct 2019 03:17:49 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 25 Oct 2019 03:17:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        cheng.shengyu@zte.com.cn, zhongshiqi <zhong.shiqi@zte.com.cn>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v3] coccicheck: Support search for SmPL scripts
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

QWxsb3cgZGVmaW5pbmcgQ09DQ0kgYXMgYSBkaXJlY3RvcnkgdG8gc2VhcmNoIFNtUEwgc2NyaXB0
cy4gU3RhcnQgYQpjb3JyZXNwb25kaW5nIGZpbGUgZGV0ZXJtaW5hdGlvbiBpZiB0aGUgZW52aXJv
bm1lbnQgdmFyaWFibGUg4oCcQ09DQ0nigJ0KY29udGFpbnMgYW4gYWNjZXB0YWJsZSBwYXRoLgoK
U2lnbmVkLW9mZi1ieTogemhvbmdzaGlxaSA8emhvbmcuc2hpcWlAenRlLmNvbS5jbj4KLS0tCkNo
YW5nZXMgaW4gdjM6CgkxOnJld3JpdGUgY2hhbmdlIGRlc2NyaXB0aW9uCgkyOmZpeCBwYXRjaCBz
dWJqZWN0CgkzOm1vZGlmeSBjb21taXQgbG9nCgpDaGFuZ2VzIGluIHYyOgoJMS5maXggcGF0Y2gg
c3ViamVjdCBhY2NvcmRpbmcgdG8gdGhlIHJlcGx5IGJ5IE1hcmt1cwoJPE1hcmt1cy5FbGZyaW5n
QHdlYi5kZT4KCTIuY2hhbmdlIGRlc2NyaXB0aW9uIGluIOKAnGltcGVyYXRpdmUgbW9vZOKAnQog
CiBzY3JpcHRzL2NvY2NpY2hlY2sgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpY2hlY2sgYi9zY3JpcHRzL2NvY2NpY2hl
Y2sKaW5kZXggZTA0ZDMyOC4uYTFjNDE5NyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jb2NjaWNoZWNr
CisrKyBiL3NjcmlwdHMvY29jY2ljaGVjawpAQCAtMjU3LDYgKzI1NywxMCBAQCBpZiBbICIkQ09D
Q0kiID0gIiIgXSA7IHRoZW4KICAgICBmb3IgZiBpbiBgZmluZCAkc3JjdHJlZS9zY3JpcHRzL2Nv
Y2NpbmVsbGUvIC1uYW1lICcqLmNvY2NpJyAtdHlwZSBmIHwgc29ydGA7IGRvCiAJY29jY2luZWxs
ZSAkZgogICAgIGRvbmUKK2VsaWYgWyAtZCAiJENPQ0NJIiBdIDsgdGhlbgorICAgIGZvciBmIGlu
IGBmaW5kICRDT0NDSS8gLW5hbWUgJyouY29jY2knIC10eXBlIGYgfCBzb3J0YDsgZG8KKwljb2Nj
aW5lbGxlICRmCisgICAgZG9uZQogZWxzZQogICAgIGNvY2NpbmVsbGUgJENPQ0NJCiBmaQotLSAK
Mi45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNv
Y2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxp
cDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
