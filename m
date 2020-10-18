Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E658291FBD
	for <lists+cocci@lfdr.de>; Sun, 18 Oct 2020 22:15:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09IKFVkh022077;
	Sun, 18 Oct 2020 22:15:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9E13177BF;
	Sun, 18 Oct 2020 22:15:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 205AC74CE
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 18:46:57 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09IGktF2000377;
 Sun, 18 Oct 2020 18:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1603039614;
 bh=yK1PJ/gOJq+OOk51w81zO9ptHCKwDVH4mV0AA4IoLoA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fBWMtzF2F5S0i2Fh6xHrvf0RLadwYn/kMvesHIb93lVeqtPbrTWfc3Mq+Zn+I24pI
 mqH5gLn7dtMogfPz6Dl60HPzFHndhdOq6T26WgdKQlDflL+FWZGpQKlHk9ZL4yh9fX
 o4ESTZBYiu9ACHy3XkOun5zIZ8TpagWCJK1LTAjg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from sonne.localnet ([93.133.46.65]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MGAG3-1kh4Fl1e2Z-00FAWv; Sun, 18
 Oct 2020 18:46:54 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Date: Sun, 18 Oct 2020 18:46:53 +0200
Message-ID: <51716926.XVqqe9kqm5@sonne>
In-Reply-To: <alpine.DEB.2.22.394.2010181819210.2759@hadrien>
References: <3528117.7ODa3CK5J5@sonne> <2774601.u91sIFNy1E@sonne>
 <alpine.DEB.2.22.394.2010181819210.2759@hadrien>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KmSLS3+kP863ygiP8Yd5E3bTEEyHc3ud2fbvs4O7DoQbuTchfFt
 sSG429O9X1CwPMwQj8/zNs2faDBJFePDY2BM8Duf2BZzlURWXtLaKHDNmpvdD84RUG+Tt2p
 SWo+BQsc5FYBPmWn7BbP8PjN4fJ5HIwKiMERTnbS+GPygBqdBZMdVS0VX6qKnofjmDuCdGh
 sQT7H0tEFCbDwYhxtI4AQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QeQBaokREIg=:3tbjgltXZhtvuGh8tffmCl
 t2KdLjZW4VphcQsHrr3qB9DXx/zujl3Isye2TcHE0XWA3NoP1b48eUamCuI0WJJ7NSH2eQ3is
 Tqdl7rwh79t/9CaLFBNIJBDi9mJ9z8cEYb0JFkqk+laQWms6SM+O+Zafy5cHt50qA/44SX/aQ
 0xJMSE4ksgEGwVv0eYZMvDhpadOMLURcnSevWA5uawNgzAdp3Dc0NR+BSnfD6kqsRoe7y4zU6
 Vwckx9eYihws567ehy4EOl1HzKzIi1c09E1fCSD9dBJHsojN4UairJtQ63uLz71SDdg8npDY9
 TUeG4IddEhITI5jvNIm5pyhnrZ7AVuChF2D9J4M6sFiXlRQ6Nym567hw1SZ//XOKcnV/XCPXB
 gQyIVRaRbNdrepbdZG7D+A6ghkes841YZxbgKnBLVKMzzvfwOqPczi/HS21ctikyLicmTvL0D
 0OS5a+QuP7k+EoXDGj6AamiU7h8LBoLSFPsYjT4blrLNtIYTHlaAlhIQH4nCwL8sAGTonE1eB
 RIsJY19kojoeu+ZcCwmcqzpH0ZWwygTJOigAJVGsFAPpbtwuBnJ9qjfHwlnh7PhLySH2oyM0r
 R6dexNZQ4mN2l+VSZkvFOK+InFDmDia2mIsG2K+bxLMOfCGZQRjCBHCsNqPHtNCLrVnKGxB8d
 yqf48eKcztRelD31nyhdauC1XCvbo8SiVHUHcM5GoVQbdSoJQZ+Qce2BaVoNE0FqfKx08nHVS
 AUOZFLP/e/4/PsdQg4qzKhfVJfQZUI6y6/fdBGLgHP0Jcs+fGarteO2Dc9tuDHNA7+zvsBOxE
 X1a/Py8lZiaXuFD+ukY59LIHkO/uVbuub4oK3APB2dCgZX8LxqCdBigjhhMFh8yNHFecQsIXR
 lhBPoGM3M5hx4Wwif/Mw==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 18 Oct 2020 22:15:31 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 18 Oct 2020 18:46:55 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 18 Oct 2020 22:15:30 +0200
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
Subject: Re: [Cocci] Determination of an usage statistic for memory
	allocation calls
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

PiA+IENhbiBzdWNoIGZhY3RzIGluZmx1ZW5jZSB0aGUgc3BlY2lmaWNhdGlvbiBvZiBlZmZpY2ll
bnQgU21QTCBkaXNqdW5jdGlvbnMgYW5vdGhlciBiaXQ/Cj4gCj4gT24gbXkgbWFjaGluZSwgcHV0
dGluZyB0aGUgdGhyZWUgZnVuY3Rpb25zIHRoYXQgeW91IGhhdmUgZm91ZG4gdG8gYmUgdGhlCj4g
bW9zdCBmcmVxdWVudCBhdCB0aGUgZW5kIG9mIGVhY2ggZGlzanVuY3Rpb24gaGFzIG5vIGltcGFj
dCBvbiB0aGUgcGVyZm9ybWFuY2UuCgpJIHByb3Bvc2UgdG8gcmVjb25zaWRlciB0aGlzIHZpZXcu
CgoKPiBTbyB3aGF0IGRvIHlvdSBzdWdnZXN0PwoKMS4gSSB3b3VsZCBhcHByZWNpYXRlIGlmIHlv
dSB3b3VsZCBzaGFyZSBtb3JlIHRlY2huaWNhbCBkZXRhaWxzIGFib3V0IHlvdXIgdGVzdCBlbnZp
cm9ubWVudAogICBmb3IgYSBzYWZlciBjb21wYXJpc29uLgoKMi4gVGhlIG9ic2VydmVkIHNvZnR3
YXJlIGJlaGF2aW91ciBjYW4gYmUgY2xhcmlmaWVkIGZ1cnRoZXIsIGNhbid0IGl0PwogICBBc3Bl
Y3RzIGxpa2UgdGhlIGZvbGxvd2luZyBjYW4gdHJpZ2dlciBjb3JyZXNwb25kaW5nIGRldmVsb3Bt
ZW50IGNvbnNpZGVyYXRpb25zLgogICAqIOKAnG5vdGljYWJsZeKAnSBkaWZmZXJlbmNlcyAoZGVw
ZW5kaW5nIG9uIHRoZSBydW4gdGltZSBlbnZpcm9ubWVudCkKICAgKiBtZWFzdXJhYmxlIGVmZmVj
dHMKICAgKiBtYXRoZW1hdGljYWwgcHJvcGVydGllcyBvZiBhbiBhbGdvcml0aG0KClJlZ2FyZHMs
Ck1hcmt1cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1l
LmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
