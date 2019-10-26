Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF21E5911
	for <lists+cocci@lfdr.de>; Sat, 26 Oct 2019 09:49:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9Q7n0kh026790;
	Sat, 26 Oct 2019 09:49:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3FFA477CE;
	Sat, 26 Oct 2019 09:49:00 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E377D77B4
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 09:48:57 +0200 (CEST)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9Q7msNl009646
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 09:48:56 +0200 (CEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id DB9542FF0B0A63FAF0D5;
 Sat, 26 Oct 2019 15:48:52 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x9Q7mZYT006117;
 Sat, 26 Oct 2019 15:48:35 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102615491942-139233 ;
 Sat, 26 Oct 2019 15:49:19 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: Julia.Lawall@lip6.fr
Date: Sat, 26 Oct 2019 15:50:48 +0800
Message-Id: <1572076248-43770-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-26 15:49:19,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-26 15:48:42
X-MAIL: mse-fl1.zte.com.cn x9Q7mZYT006117
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 26 Oct 2019 09:49:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 26 Oct 2019 09:48:56 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        cheng.shengyu@zte.com.cn, zhongshiqi <zhong.shiqi@zte.com.cn>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v4] coccicheck: Support search for SmPL scripts
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

QWxsb3cgZGVmaW5pbmcgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIOKAnENPQ0NJ4oCdIGFzIGEg
ZGlyZWN0b3J5IAp0byBzZWFyY2ggU21QTCBzY3JpcHRzLiBTdGFydCBhIGNvcnJlc3BvbmRpbmcg
ZmlsZSBkZXRlcm1pbmF0aW9uCmlmIGl0IGNvbnRhaW5zIGFuIGFjY2VwdGFibGUgcGF0aC4KClNp
Z25lZC1vZmYtYnk6IHpob25nc2hpcWkgPHpob25nLnNoaXFpQHp0ZS5jb20uY24+Ci0tLQpDaGFu
Z2VzIGluIHY0OgoJMTpyZXdyaXRlIGNoYW5nZSBkZXNjcmlwdGlvbiBpbiBhbm90aGVyIHdvcmRp
bmcKCkNoYW5nZXMgaW4gdjM6CgkxOnJld3JpdGUgY2hhbmdlIGRlc2NyaXB0aW9uCgkyOmZpeCBw
YXRjaCBzdWJqZWN0CgkzOm1vZGlmeSBjb21taXQgbG9nCgpDaGFuZ2VzIGluIHYyOgoJMS5maXgg
cGF0Y2ggc3ViamVjdCBhY2NvcmRpbmcgdG8gdGhlIHJlcGx5IGJ5IE1hcmt1cwoJPE1hcmt1cy5F
bGZyaW5nQHdlYi5kZT4KCTIuY2hhbmdlIGRlc2NyaXB0aW9uIGluIOKAnGltcGVyYXRpdmUgbW9v
ZOKAnQogCiBzY3JpcHRzL2NvY2NpY2hlY2sgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpY2hlY2sgYi9zY3JpcHRzL2Nv
Y2NpY2hlY2sKaW5kZXggZTA0ZDMyOC4uYTFjNDE5NyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jb2Nj
aWNoZWNrCisrKyBiL3NjcmlwdHMvY29jY2ljaGVjawpAQCAtMjU3LDYgKzI1NywxMCBAQCBpZiBb
ICIkQ09DQ0kiID0gIiIgXSA7IHRoZW4KICAgICBmb3IgZiBpbiBgZmluZCAkc3JjdHJlZS9zY3Jp
cHRzL2NvY2NpbmVsbGUvIC1uYW1lICcqLmNvY2NpJyAtdHlwZSBmIHwgc29ydGA7IGRvCiAJY29j
Y2luZWxsZSAkZgogICAgIGRvbmUKK2VsaWYgWyAtZCAiJENPQ0NJIiBdIDsgdGhlbgorICAgIGZv
ciBmIGluIGBmaW5kICRDT0NDSS8gLW5hbWUgJyouY29jY2knIC10eXBlIGYgfCBzb3J0YDsgZG8K
Kwljb2NjaW5lbGxlICRmCisgICAgZG9uZQogZWxzZQogICAgIGNvY2NpbmVsbGUgJENPQ0NJCiBm
aQotLSAKMi45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0
ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
