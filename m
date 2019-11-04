Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 222DAED818
	for <lists+cocci@lfdr.de>; Mon,  4 Nov 2019 04:35:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA43YkaI024965;
	Mon, 4 Nov 2019 04:34:46 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C9E8477CC;
	Mon,  4 Nov 2019 04:34:46 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 169E87B9
 for <cocci@systeme.lip6.fr>; Mon,  4 Nov 2019 04:34:45 +0100 (CET)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA43Yf1N022732
 for <cocci@systeme.lip6.fr>; Mon, 4 Nov 2019 04:34:43 +0100 (CET)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 1C669989B3F1B7C30B8C;
 Mon,  4 Nov 2019 11:34:38 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id xA43XC9q090748;
 Mon, 4 Nov 2019 11:33:12 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019110411331571-271048 ;
 Mon, 4 Nov 2019 11:33:15 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: Julia.Lawall@lip6.fr
Date: Mon, 4 Nov 2019 11:35:55 +0800
Message-Id: <1572838555-12101-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-11-04 11:33:15,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-11-04 11:33:13
X-MAIL: mse-fl1.zte.com.cn xA43XC9q090748
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 04 Nov 2019 04:34:49 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 04 Nov 2019 04:34:43 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, corbet@lwn.net,
        linux-doc@vger.kernel.org, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        cheng.shengyu@zte.com.cn, zhongshiqi <zhong.shiqi@zte.com.cn>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v6] coccicheck: Support search for SmPL scripts
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
IGRpcmVjdG9yeSB0bwpzZWFyY2ggU21QTCBzY3JpcHRzLgoKKlN0YXJ0IGEgY29ycmVzcG9uZGlu
ZyBmaWxlIGRldGVybWluYXRpb24gaWYgaXQgY29udGFpbnMgYW4gYWNjZXB0YWJsZQpwYXRoLgoK
KlVwZGF0ZSBjb2NjaW5lbGxlLnJzdCBkb2N1bWVudHMgZm9yIHVzZSBjb2NjaWNoZWNrIHdpdGgg
YSBkaXJlY3RvcnkKc2VsZWN0aW9uCgpTaWduZWQtb2ZmLWJ5OiB6aG9uZ3NoaXFpIDx6aG9uZy5z
aGlxaUB6dGUuY29tLmNuPgotLS0KQ2hhbmdlcyBpbiB2NjoKCXVwZGF0ZSBjb2NjaW5lbGxlLnJz
dCBkb2N1bWVudHMgYW5kIGFkZCBpbnN0cnVjdGlvbnMgZm9yIHVzZSB0aGlzCgpDaGFuZ2VzIGlu
IHY1OgoJcmV3cml0ZSBjaGFuZ2UgZGVzY3JpcHRpb24gYXMgYW4gZW51bWVyYXRpb24KCkNoYW5n
ZXMgaW4gdjQ6CglyZXdyaXRlIGNoYW5nZSBkZXNjcmlwdGlvbiBpbiBhbm90aGVyIHdvcmRpbmcK
CkNoYW5nZXMgaW4gdjM6CgkxOnJld3JpdGUgY2hhbmdlIGRlc2NyaXB0aW9uCgkyOmZpeCBwYXRj
aCBzdWJqZWN0CgkzOm1vZGlmeSBjb21taXQgbG9nCgpDaGFuZ2VzIGluIHYyOgoJMS5maXggcGF0
Y2ggc3ViamVjdCBhY2NvcmRpbmcgdG8gdGhlIHJlcGx5IGJ5IE1hcmt1cwoJPE1hcmt1cy5FbGZy
aW5nQHdlYi5kZT4KCTIuY2hhbmdlIGRlc2NyaXB0aW9uIGluIOKAnGltcGVyYXRpdmUgbW9vZOKA
nQoKIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2NvY2NpbmVsbGUucnN0IHwgNTEgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogc2NyaXB0cy9jb2NjaWNoZWNrICAgICAgICAgICAg
ICAgICAgICAgfCAgNCArKysKIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvY29jY2lu
ZWxsZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9jb2NjaW5lbGxlLnJzdAppbmRleCAw
MGEzNDA5Li42YWYzMjAxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9jb2Nj
aW5lbGxlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9jb2NjaW5lbGxlLnJzdApA
QCAtMTAwLDggKzEwMCw4IEBAIFR3byBvdGhlciBtb2RlcyBwcm92aWRlIHNvbWUgY29tbW9uIGNv
bWJpbmF0aW9ucyBvZiB0aGVzZSBtb2Rlcy4KICAgSXQgc2hvdWxkIGJlIHVzZWQgd2l0aCB0aGUg
QyBvcHRpb24gKGRlc2NyaWJlZCBsYXRlcikKICAgd2hpY2ggY2hlY2tzIHRoZSBjb2RlIG9uIGEg
ZmlsZSBiYXNpcy4KIAotRXhhbXBsZXMKLX5+fn5+fn5+CitVc2luZyBDb2NjaW5lbGxlIHdpdGgg
ZGVmYWx1dCB2YWx1ZQorfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIAogVG8g
bWFrZSBhIHJlcG9ydCBmb3IgZXZlcnkgc2VtYW50aWMgcGF0Y2gsIHJ1biB0aGUgZm9sbG93aW5n
IGNvbW1hbmQ6OgogCkBAIC0xMjcsNiArMTI3LDM4IEBAIFRvIGVuYWJsZSB2ZXJib3NlIG1lc3Nh
Z2VzIHNldCB0aGUgVj0gdmFyaWFibGUsIGZvciBleGFtcGxlOjoKIAogICAgbWFrZSBjb2NjaWNo
ZWNrIE1PREU9cmVwb3J0IFY9MQogCitVc2luZyBDb2NjaW5lbGxlIHdpdGggYSBzaW5nbGUgZmls
ZSBzZWxlY3Rpb24KK35+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgorCitUaGUgb3B0aW9uYWwgbWFrZSB2YXJpYWJsZSBDT0NDSSBjYW4gYmUgdXNlZCB0byBjaGVj
ayBhIHNpbmdsZQorc2VtYW50aWMgcGF0Y2guIEluIHRoYXQgY2FzZSwgdGhlIHZhcmlhYmxlIG11
c3QgYmUgaW5pdGlhbGl6ZWQgd2l0aAordGhlIG5hbWUgb2YgdGhlIHNlbWFudGljIHBhdGNoIHRv
IGFwcGx5LgorCitGb3IgaW5zdGFuY2U6OgorCisJbWFrZSBjb2NjaWNoZWNrIENPQ0NJPTxteV9T
UC5jb2NjaT4gTU9ERT1wYXRjaAorCitvcjo6CisKKwltYWtlIGNvY2NpY2hlY2sgQ09DQ0k9PG15
X1NQLmNvY2NpPiBNT0RFPXJlcG9ydAorCisKK1VzaW5nIENvY2NpbmVsbGUgd2l0aCBkaXJlY3Rv
cnkgc2VsZWN0aW9uCit+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgor
CitUaGUgb3B0aW9uYWwgbWFrZSB2YXJpYWJsZSBDT0NDSSBjYW4gYmUgdXNlZCB0byBzZWFyY2gg
U21QTCBzY3JpcHRzIGluIGEKK2RpcmVjdG9yeS4gSW4gdGhhdCBjYXNlLCB0aGUgdmFyaWFibGUg
bXVzdCBiZSBpbml0aWFsaXplZCB3aXRoIHRoZSBuYW1lIG9mCithIGRpcmVjdG9yeSB3aGljaCBj
b250YWlucyBzY3JpcHRzIGZvciB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UuCisKK0ZvciBp
bnN0YW5jZTo6CisKKwltYWtlIGNvY2NpY2hlY2sgQ09DQ0k9PG15X1NQRElSPiBNT0RFPXBhdGNo
CisKK29yOjoKKworCW1ha2UgY29jY2ljaGVjayBDT0NDST08bXlfU1BESVI+IE1PREU9cmVwb3J0
CisKKwogQ29jY2luZWxsZSBwYXJhbGxlbGl6YXRpb24KIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogCkBAIC0xNDgsMjEgKzE4MCw2IEBAIFdoZW4gcGFybWFwIGlzIGVuYWJsZWQsIGlmIGFu
IGVycm9yIG9jY3VycyBpbiBDb2NjaW5lbGxlLCB0aGlzIGVycm9yCiB2YWx1ZSBpcyBwcm9wYWdh
dGVkIGJhY2ssIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIGBgbWFrZSBjb2NjaWNoZWNrYGAKIGNh
cHR1cmVzIHRoaXMgcmV0dXJuIHZhbHVlLgogCi1Vc2luZyBDb2NjaW5lbGxlIHdpdGggYSBzaW5n
bGUgc2VtYW50aWMgcGF0Y2gKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQotCi1UaGUgb3B0aW9uYWwgbWFrZSB2YXJpYWJsZSBDT0NDSSBjYW4gYmUgdXNlZCB0
byBjaGVjayBhIHNpbmdsZQotc2VtYW50aWMgcGF0Y2guIEluIHRoYXQgY2FzZSwgdGhlIHZhcmlh
YmxlIG11c3QgYmUgaW5pdGlhbGl6ZWQgd2l0aAotdGhlIG5hbWUgb2YgdGhlIHNlbWFudGljIHBh
dGNoIHRvIGFwcGx5LgotCi1Gb3IgaW5zdGFuY2U6OgotCi0JbWFrZSBjb2NjaWNoZWNrIENPQ0NJ
PTxteV9TUC5jb2NjaT4gTU9ERT1wYXRjaAotCi1vcjo6Ci0KLQltYWtlIGNvY2NpY2hlY2sgQ09D
Q0k9PG15X1NQLmNvY2NpPiBNT0RFPXJlcG9ydAotCiAKIENvbnRyb2xsaW5nIFdoaWNoIEZpbGVz
IGFyZSBQcm9jZXNzZWQgYnkgQ29jY2luZWxsZQogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpY2hlY2sg
Yi9zY3JpcHRzL2NvY2NpY2hlY2sKaW5kZXggZTA0ZDMyOC4uYmZlMGM5NCAxMDA3NTUKLS0tIGEv
c2NyaXB0cy9jb2NjaWNoZWNrCisrKyBiL3NjcmlwdHMvY29jY2ljaGVjawpAQCAtMjU3LDYgKzI1
NywxMCBAQCBpZiBbICIkQ09DQ0kiID0gIiIgXSA7IHRoZW4KICAgICBmb3IgZiBpbiBgZmluZCAk
c3JjdHJlZS9zY3JpcHRzL2NvY2NpbmVsbGUvIC1uYW1lICcqLmNvY2NpJyAtdHlwZSBmIHwgc29y
dGA7IGRvCiAJY29jY2luZWxsZSAkZgogICAgIGRvbmUKK2VsaWYgWyAtZCAiJENPQ0NJIiBdIDsg
dGhlbgorICAgIGZvciBmIGluIGBmaW5kICRDT0NDSS8gLW5hbWUgJyouY29jY2knIC10eXBlIGYg
fCBzb3J0YDsgZG8KKyAgICAgICBjb2NjaW5lbGxlICRmCisgICAgZG9uZQogZWxzZQogICAgIGNv
Y2NpbmVsbGUgJENPQ0NJCiBmaQotLSAKMi45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxp
cDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
