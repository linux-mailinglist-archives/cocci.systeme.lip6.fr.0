Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC3D7050
	for <lists+cocci@lfdr.de>; Tue, 15 Oct 2019 09:40:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F7eMdX012596;
	Tue, 15 Oct 2019 09:40:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E5C4277C3;
	Tue, 15 Oct 2019 09:40:21 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0C28944B2
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 09:40:20 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F7eJUu001624;
 Tue, 15 Oct 2019 09:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1571125214;
 bh=jQCSL5RA6srTj1ix3Aoag1Yaa4Cjy0Je61IA9ppX7LU=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=n/aaOfGuPywlB3yVe1tNTXe2Uf5RRng1koTR64Kc4zxPKJW6jHrX3erfSk5IUroqK
 0L1YzFSsgMDw15KvaPyWnAQqT94q14PoiaD3dkBRoaov+wUPhc7O8zNVAgahhuKpuA
 FbjV7o8sEc/Redtr2ZuOJyIq7hBtYnbV8WVmrCgA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.79.11]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKaDH-1iJRpB1dMV-00205h; Tue, 15
 Oct 2019 09:40:14 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Julia Lawall <julia.lawall@lip6.fr>,
        =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <56102ab5-b633-7e14-1fd3-3f43fb0770b9@web.de>
 <alpine.DEB.2.21.1910141740580.2330@hadrien>
 <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <08d27bd5-a93e-1128-c515-0689e468b0bf@web.de>
Date: Tue, 15 Oct 2019 09:40:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:n5sY7+LzyjNwNf5Nv3iAF88Oln3jwNx8GXtyqbNCXV2oBEfaXBj
 AipJ4PgBoAONunSGZdGFXuyizfBxu1ABxJApKuVq3/8RGyPwG+8dCy0MkV1P8aunA+4XPcI
 9CFB29xVYKHKspHfb0fr81HesOMELTE1c9bMMCGSQRBvbw3SdbizaMtBfp4GP6x0Nki4SYZ
 qbzX7t28BESnKEkp5PC8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zWrRxeGYUXQ=:88AvS+R0H0I3tZ7T+6s+kU
 z4tQ/rj9PTuDJXmOaPHReAre8oYSpPphwkHo4MPUH8ptMkzap2PDyeNzZii8R3xAevXQKXELP
 KKZpiR3Ysn27UYDw2UJXF3EXH6yYvk9iXLoOsTP53kZEAXqi9UjixPi2ij8AvNh3d6jRJ+KQT
 Ts6a9wbIZcjMry5nipCApjnYuS1BhgubSf2ZeAYzrfs3CaJs/UVCAB3iwML3ejFRyHDndbS9b
 I9p0xs9j40AgU5WRINdm+UZeDDEweG/Qx24P4Wsejio0p34haRONFT6PMT0dWUKahxHX2JAKP
 B9DuFR1snW2q/XFcEU4k3R+QM7Cb0YeUhPFn0slw/xvCC2D8vfCpHba8fQ5HOE3J/9KyMH11n
 1FlWF1F7jOaUe6byh5CRfioaBwcda6cgJSN1FPAUGWC4sTElnOTxJrtDVgYl049jPzN0OheZ0
 ZlgKjXAcmkzI3MUPotQmvIddDIvslDsAodlcP886xpEaovO2HHG01vuYZd0WIiWE3QGc9LCF6
 ZMITGGMN1duA8WJDEx5Y7P2hMFdHnZrQ66xh/cH40FdfzmS1TTQ/NKDXB2pds5dJuoLJxwip6
 E+9Knf2j5jXfGALmY4l0bLaJPfwLIBGj/RbtDYYbKJUsoQ911JQAgP6/pwc0XVR5O+aE3nxR+
 bxjFean2m7CTSSx/d9vmuu0LuUPk6/ag7AYm+vKwCSH86MZbEwejkMEWwdLbEiibWS0fxqW0D
 OvPjMm2BkUMUlSGGDr8m8fnlgYIIqnEJbL0ojRqljmzjtYl2yyPhMIkA6vaxWpuw7uloYj+0V
 FpghqVnkElXwxkEhmlpVPAL56HabAWAfUaAm72ZNPfQJ0Aj/n/shwHP9TH3ohkUFCduXiu933
 mGJoycTzkDNQtZQkBaCM0ZymZ2TLYfSDdec9kXjuAeNmLFYyYG4bQzePX0xJ2g5hWy0Nbikc0
 Y1TxRV7ej+vOb8DwwXNiSUiJ+pqqcmeWmHwegGpFAQriNdVTLBuftgfjbw3DTNpyNgGae8+nZ
 UM60RHRtjaQApueup2GOBoNZ91eXIbEOTIF9gbSOQcVIqUC4MlOQQErOcz4kEzi/fZUOhxefu
 i3J7YTsBgpJa3CY6Igiz6O9kAmGyQx8sBmtViBDZDRpawPc0i0hhmz/bLQB+YdGOtJGxcKkQI
 zC973G7nRzQxg77+W9AJ1FuQfLX0fa/BUUR0Od3rJGAOi7BpAfzT3WrLmy73HZCX2s3iWfMvH
 lv+S6dFy80tGYV6/ucosIntGZ0wR2tsCTdVq6vBQIlJOLK7LW/SpHPb6djNQ=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 09:40:22 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 09:40:19 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] macro parameters and expressions?
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

Pj4+ICogRml4IHNlYXJjaCBmb3IgcGFyYW1ldGVyaXNlZCBtYWNyb3Mgd2l0aCBTbVBMCj4+PiAg
IGh0dHBzOi8vZ2l0aHViLmNvbS9jb2NjaW5lbGxlL2NvY2NpbmVsbGUvaXNzdWVzLzk0CgpUaGVy
ZSBhcmUgZnVydGhlciBzb2Z0d2FyZSBkZXZlbG9wbWVudCBjaGFsbGVuZ2VzIHRvIGNvbnNpZGVy
CmFyb3VuZCBwcmVwcm9jZXNzb3IgY29kZS4KCmVsZnJpbmdAU29ubmU6fi9Qcm9qZWt0ZS9Db2Nj
aW5lbGxlL1Byb2JlPiBzcGF0Y2ggLS1wYXJzZS1jIErDvHJnZW5fR3Jvw58tQmVpc3BpZWwyLmMK
4oCmCkVSUk9SLVJFQ09WOiBmb3VuZCBzeW5jIGVuZCBvZiAjZGVmaW5lLCBsaW5lIDEK4oCmCnBh
cnNlIGVycm9yCiA9IEZpbGUgIkrDvHJnZW5fR3Jvw58tQmVpc3BpZWwyLmMiLCBsaW5lIDEsIGNv
bHVtbiA2NSwgY2hhcnBvcyA9IDY1CiAgYXJvdW5kID0gJygnLAogIHdob2xlIGNvbnRlbnQgPSAj
ZGVmaW5lIE1BQ1JPKG5hbWUpIHNucHJpbnRmKGJ1ZmZlciwgUEFHRV9TSVpFLCAiJXVcbiIsIHBv
aW50ZXItPihuYW1lKSk7CmJhZGNvdW50OiAwCkJBRDohISEhISAjZGVmaW5lIE1BQ1JPKG5hbWUp
IHNucHJpbnRmKGJ1ZmZlciwgUEFHRV9TSVpFLCAiJXVcbiIsIHBvaW50ZXItPihuYW1lKSk7CuKA
pgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6
Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
