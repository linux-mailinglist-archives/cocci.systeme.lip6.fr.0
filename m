Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1882A482
	for <lists+cocci@lfdr.de>; Sat, 25 May 2019 15:01:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PD0Vgh025251;
	Sat, 25 May 2019 15:00:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5CF1D7760;
	Sat, 25 May 2019 15:00:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E212F774C
 for <cocci@systeme.lip6.fr>; Sat, 25 May 2019 15:00:29 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PD0ThK022122;
 Sat, 25 May 2019 15:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1558789229;
 bh=JvZaCephOB7oKt7ObozT5d5QUh5oCb61c2mKl9cgDW8=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=J6EkBNs2LflFzKeYJuJEvzGr1mGuyKgdz+9G9krePWocfi3RyulUPGbHXdCIi6/lW
 EEm1mKKkm4Km9jKv77K17OISRXcANYLloGKV2Id0ySqC/1x8iD3CI/NrAeTSKaVkut
 bS8NQEht256w2WMnbnqxs0t+uVYoguwLRXzkQeNM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([93.131.6.10]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LbrUu-1gnio43zS0-00jMH5; Sat, 25
 May 2019 15:00:29 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
 <81b409c6-5986-5961-5edf-843c6737d88c@web.de>
 <alpine.DEB.2.20.1905231500230.3573@hadrien>
 <b5c322d3-3162-953f-a985-53abc5064482@web.de>
 <0782D580-3DD6-4419-B5E1-C04215FB2E3B@lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bcc5a120-dc66-7511-a401-e14c322dd67b@web.de>
Date: Sat, 25 May 2019 15:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0782D580-3DD6-4419-B5E1-C04215FB2E3B@lip6.fr>
Content-Language: en-GB
X-Provags-ID: V03:K1:+eVB3m3dKUA0C/co+HaQmfANrs3drR4UhoCd3oIsqPJd9/1G6aP
 cZ28uBR8CuJFBQ3KJuT2iUP0A2v58dYmZO9TGXffzE86VSFEomQYfGKjmMzFORkGmtUAQkf
 P07F8NMHctT6Oce003XnLUWn42bbyKfDliLjA+tky4vKlS8qUIVd8rZ2QQYiVWEzoTa62J2
 RduYl+BN/XDDULYFolZhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qY1/85B4Tm4=:njGQEp1uW+cmgA+KI0JCug
 WkiEdpVYRTENHGWmn1pDZeGn1vEfjHXFYwwIiGQTgqoHYUTA/8QtrCpnuD+TyptkEV/jwrJ/X
 CniydQJFGP7RKga4uGF25NRRlLtbJ+rnU3oZcPLomGnjjwtbyO2GmZ45tep3ACJV6QKkGApbm
 S/h98RsznYys/ZBtmC2DxiMAPX5hwYbst+VE/XRYgMc2Xvq52p72VL3MD738r14oMH9h9dfSD
 Wv04WoYQ/zDzTDsyNm4RZMxMfCP/7Y70APXE7hB8LsfHRt4R23VG4/Oa99gAztAps+xY0xpbG
 N4cwAWOM0MqZpuBtJe34jzSoehUjpUyIjXLjLjVZzQ2NF52o8hNLGdGr2Ce/83EpxVwhkJoC/
 vfhDss+V7cYW2YBaybdR/DB2umKJVKlNeZ3vJbQHl1k7Q4JpZVvhu94IawTlEZudX1yDI4cqO
 FvUEsVlTkY+h4OeJiHlIaxSLtnNwRRQmHayW+E4wd/NqskspWP1RCxfMpfKOlkq/bBTVI23q2
 cJpEkoCHewBiNYG4P9aUyVPmHYb8Ve+FJRYUWxdqRQ1VzXoVc3bJQI4ZsSgHRTE1M3x+vaNcr
 KSFHfX+FtPEen9e0Za4KaQpwgZIuQSTIMnc8UXYWW04WD4tFs0iVAJ21soCzYaK+DD1O/sFFN
 D9c9Kmb6nvCNp/dP1FHsvZBL/zgrASs5rwdFCfV/q689WEOvEAJmEKXNcuxD6lwBHs3z9aBn6
 ceNUZH2AAhpWYUu/w0Gv5WUCM956mBgIogdA2PWa9xuQpuovchQ1L5sHf5ewacYCqV7KzMsXe
 YCHcXW2cWqdyvXpzEiM31qHxkjzw7dQXALAEP0CBGPbZcT40FlU4lr3O1OdO/uW4VmTSo7bS7
 eglc6IeQo6Z/eJmjCc0Da5SUYLvFBHNltP6QMf39w/vjqImv6s+6g2EvFdNCbXXsiZ/nWoYeZ
 ZZDdVS1JvxxAfNkA5bhO/2Ogz+E+vdSBFFEQB24JPV1XRoZ3TODBa
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 25 May 2019 15:00:32 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 25 May 2019 15:00:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] accessing comments
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

Pj4gKiBOb3cgSSB3b25kZXIgd2h5IHRoaXMgZGlzcGxheSBpcyBwcmVzZW50ZWQgaW4gdGhyZWUg
dmFyaWF0aW9ucy4KPgo+IEJlZm9yZSB3aXRoaW4gYW5kIGFmdGVyCgpJIGZpbmQgdGhpcyBzb2Z0
d2FyZSBiZWhhdmlvdXIgaGFyZCB0byB1bmRlcnN0YW5kIGF0IHRoZSBtb21lbnQKd2hlbiB0aGUg
c2hvd24gbWV0YXZhcmlhYmxlcyB3ZXJlIHNwbGl0IGludG8gdGhyZWUgcGFydHMgYWxyZWFkeQpi
eSB0aGUgY2FsbCBvZiB0aGUgT0NhbWwgZnVuY3Rpb24g4oCcTGlzdC5oZOKAnS4KCldoaWNoIGNv
bW1lbnQgd291bGQgYmUgcHJvdmlkZWQgYXMg4oCcd2l0aGlu4oCdIHRleHQ/CgpSZWdhcmRzLApN
YXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29j
Y2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlw
Ni5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
