Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9F5825F
	for <lists+cocci@lfdr.de>; Thu, 27 Jun 2019 14:19:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5RCIe02008787;
	Thu, 27 Jun 2019 14:18:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6716F7785;
	Thu, 27 Jun 2019 14:18:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 75C2D7772
 for <cocci@systeme.lip6.fr>; Thu, 27 Jun 2019 14:18:38 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5RCIag2001189;
 Thu, 27 Jun 2019 14:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561637915;
 bh=JNQjwklhwraEI8entVwws0/6kdjUSr5hDNXF+OqDV4E=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=dePpY4mX371VI3TrjsFFM+Y18XeT7fsxeABMBheW+kvdfAB6+dL0fuht5z99Ig0AZ
 3R2KeYpgeoAu6BekbCRLiR+FOXNsY2H0DLBCYeRz4u98QHvXdySjwL1QTyvzxKbvbn
 m4oxXgcfETDiIvvatvDIJHRQGNcmztt+wsGcWR5U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.74.178]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LlWKh-1iFG0q236N-00bM7y; Thu, 27
 Jun 2019 14:18:35 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <f79ae892-a674-5f69-1d25-88594a89ebff@web.de>
 <alpine.DEB.2.21.1906271332240.2627@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f84bb58a-916b-0d6b-64fd-7805bd8db827@web.de>
Date: Thu, 27 Jun 2019 14:18:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906271332240.2627@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:xyLfCdsZxahBsF0iQNgXh5HmZ9ATbb3cJeeIL08cwzzO+DWDg2t
 HBwHHyjEEVzOjCWiwqPRk/6L/t5q3ENwxlJjSqHNCCgRHuKKg+sXHIbSAHMbsK1tF5v4NVZ
 7HGkyXiEWkqztiGjFVRul0clWPVd8q2oeWAbL5IJ3u2CeOmfADzVLrYKJNYYs3I+iE4StnZ
 /F+RSqXJGQvQBqoPHKa1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/fRh1r2FHc8=:927Y7zxfn4oZuJnBedPtPV
 dcys3QlD3+wY/9FxcRtk1+ZIUs2+KKp2aSxkbRui9GJCe7nG57SGexJro6wBxEF6FV4Lps13l
 IJ1tRcw3+P9SFVQ2BJc/vbFm5fMJme0X1OiBW4X0pjJdedcgkzD53MprdLCdRtbekgESgDGxt
 7a9yINB8gkaa2X7ApJcwaOxmHIlVFnkuTNN1nbUmuKHlEVVrn9CLFsOz8OQbrQlzBu6zrCGGn
 DMWvwOZ8KdL4s73nGvQx5t+/ms9TlnC+6W/yds9VKsupFgegS3jWZ9zxaIQH7KdYGXZ+FXXUD
 H97IyHQUkKHg0AED0/LAvvW5RVccena4bA9afpn8LsAKSWgbFbCBR6kBN5DwuiavWw6LGJs6N
 TQzrPaWkQZVt8fP9rMNCh2qEeuF8E2A55kUdzsSk3dj3Wyw6/RRSFXoyOwXQ/FYLunLY0tEdL
 siVLPTZFQNWb7KO/GpUdmB5lHx/3rfIAk8sJxNnlFkL0h7P0TZ1NU7SASz0XvAaDz9Pd41FJh
 dtIbnadwfnIMHaaUMP5yESjaYyniYHABD7A3605Qx2cAtPXUNLJrQcfz8Fj8BgqjlpxeM/jUc
 1CE9vt2kkPyX7hj15Tgd/KpNkgCC4VA0gQmRmnOmyYD7ECsNRI0XByirclIzWNNFcf2ua0+KG
 ykENGSkgvGNoLlZl2V08fWHjsjAGVuMr3izqaQEgD26k1btdi3Y4CKOPnnvsJAwhZ9VYDJ8bt
 ryN9g+F0ByPMa11CE5EkgputMZDVkbrdjU8DxviGXsdK6ZdL4jZFTL+irLkOR7Hs+Q/Q4//JW
 c1WcFTm73bF4Ziocmz+xMpmtVvW/RvcbEz3KNFn04+L8GfvshqsVI/rLtJcOV23CDrK3jBX+b
 sJxNicPNhYjvEKBF7bx4xwQG+PQwncMxIR+Mo5echgqeUJ1QYZrSrt8tqKlg6DDm/YxRbTdOa
 Sy8gqmkPJlzZj3HWEpigXmNHgaQqCB/fCviSKVwvNxP4pSJDIFci1Cb8NxX7k6ZVwKqZy0Vvw
 dUmfxj+xTFMGPnwf5QxS/qbOey3vMhI9ZqLVsDeF+eWy+/rjQPgokF4XyIvWWEbM+rTBhLcDw
 cc97vS0s4Kc1u2ZcY9F+p69OLzVf5cquPUq
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 27 Jun 2019 14:18:41 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 27 Jun 2019 14:18:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Moving exception handling code to the end of a function
 implementation with SmPL?
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

PiBNYXliZSB0aGVyZSBhcmUgdG9vIG1hbnkgbWV0YXZhcmlhYmxlIGJpbmRpbmdzLgoKVW5kZXIg
d2hpY2ggY2lyY3Vtc3RhbmNlcyB3b3VsZCBzdWNoIGEgc2l0dWF0aW9uIHJlYWxseSBvY2N1cj8K
CkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgbXkgU21QTCBzY3JpcHQgZXhhbXBsZSBmb3IgdGhlIHNo
b3duIHVzZSBjYXNlPwoKCj4gWW91IGNhbiB0cnkgd2l0aCB0aGUgb3B0aW9uIC0tZGVidWcuCj4g
T3IgaWYgdGhhdCBkb2Vzbid0IGhlbHAgd2l0aCB0aGUgb3B0aW9uIC0tdmVyYm9zZS1jdGwtZW5n
aW5lLgoKSG93IGNhbiB0aGVzZSBwYXJhbWV0ZXJzIGhlbHAgdG8gY2xhcmlmeSB1bmRlc2lyYWJs
ZSBydW4gdGltZSBjaGFyYWN0ZXJpc3RpY3M/CgoKSXMgaXQgZXZlbnR1YWxseSBlYXNpZXIgdG8g
ZXhwbGFpbiB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uPwoKZWxmcmluZ0BTb25uZTp+L1Byb2pl
a3RlL0NvY2NpbmVsbGUvUHJvYmU+IHNwYXRjaCAtLWRlYnVnIG1lZ2FyYWlkX3Nhcy1leGNlcnB0
MS5jIH4vUHJvamVrdGUvQ29jY2luZWxsZS9qYW5pdG9yL21vdmVfZXJyb3JfY29kZV9hc3NpZ25t
ZW50X3RvX2Z1bmN0aW9uX2VuZDEuY29jY2kK4oCmCnJlcGxhY2VtZW50OiBhbHJlYWR5IHRhZ2dl
ZCB0b2tlbjoKQyBjb2RlIGNvbnRleHQK4oCmCgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApD
b2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0
aW5mby9jb2NjaQo=
