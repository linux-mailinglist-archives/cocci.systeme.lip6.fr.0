Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19F102E45
	for <lists+cocci@lfdr.de>; Tue, 19 Nov 2019 22:34:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLXkNw006986;
	Tue, 19 Nov 2019 22:33:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E105B77D8;
	Tue, 19 Nov 2019 22:33:46 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 861A777D8
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 22:33:44 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLXhWW006748;
 Tue, 19 Nov 2019 22:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574199221;
 bh=JIZlx2xADhR44OpL9SkZ4uG9PrdcPP0WdD2iX0/LZb0=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=dxrPptYZmKgmrMZVPU9D2KbCo9mDSzXu7RK3t7d2nD6j+qz4Un/TYIYTLybzf660h
 Qa7cs71Dqf1I5J1hzsmiKhpddSkK793xFb2BcULBu59QOsH7k3kp5heodG2Jqfpsg9
 MVgdrc8/ByyO4cbifOGjphiZyJA1P2hosMV3gmVU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.93.164]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MQvhG-1iPynq3TGo-00UHNt; Tue, 19
 Nov 2019 22:33:40 +0100
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
References: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <75dbbf44-01ee-5d15-4b3b-1c9106fa8412@web.de>
Date: Tue, 19 Nov 2019 22:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
Content-Language: en-US
X-Provags-ID: V03:K1:dQuRJfpXRhzPavtY9uBsQNhpM9Vyr4HLbZXB8s7yoL9CS1gXwMD
 BICkZE2z8gJ1tztlVEn4gVoIzv7nbKyFR8VNKQQdTML9Z8ipfDvx+SFBsELeVsX7Z0PlbFf
 +zTUSOupPtF88j2FrxHiLYBj3acnDUKYMCix9lPsB0r5uIBVRyYH15Wx1n4lZVbusxm8m3H
 xOBqneAEMxYmvALkz3o3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6In89mcwEzc=:O7SN+tHDW6Uen3LSuFRu/d
 Z7+tgmTwToxoORiP1piNDW7blcr90g0ZfuEQTcLik9w9gSayXi7tq/hmm9exx5cSORKCw4wAP
 KbMx2ydZBRPZPKyZdCGBCUfPSuMmcz/pX2s9ldTkn0Uowafa3ZDMEMBAjJ0CDXZUfnJ40/O2h
 AqTrDFalq5Ce2clCr+EGv+nRIuxONhyxWfTY0p+3iZ5Nz2SJGUDilJwYWS3MDU9oedgmKTwfB
 De2dBS7p57Ddu6Ydp3FNhUcSA01oT/R7Qua+PxGMrQdGyhBLgtVCEuiTIR3LuWb0Ykr2oStCf
 01cE6t3MP+IqtiNqx8aRvoN4SC+wb/wwEEDk1Q7B4z549BR6TPO+XOIruMLruskxTRiuowxBA
 GDyzoyHtGddJPiNeYVLVyrMYHT3gKVdRGj2cqkwlCsXqiACCxNjxU/SUO/7aP3drw3C5Aj5Fe
 SMV7GeG9IRpt+rmrIgobKTe0yrLHzxvSEpE5iPRuBZLCoufgd+82L2VVjqbnxv6rgXNuf+DtD
 6lGW+jhQir//GleviaufnNmx6FsX9GzMRl3H29aLLpiHWT0QY+QMyd7RYECp/F/zOKEuT8AuN
 NxEHxErH6WBkN7vtWJUCwKslYQM0rz3+4aYnCH8xnmWnSd6vrSitriuVAO4zrImEXk/GOVZcn
 5CMzRU7y8cqWhGqJfA1QMGtepVuGohQ1jYYp7LI3+GEX/xVBTfuVPG4iFfKiGf6BnQ89Wnl/A
 nD+KOzOWLhDQYueZbLq981A3D6HbRpFLKd5MQxzZ5TwxuvqEzcrSzKuMmyt1B0m6SqXD0FopL
 OhpqiTQ6TgKhbr3OjN3R6EUY9XYkpuIsMpbmGm5EA89he1yAzUhRtzHEfaGprBL2j2t6fPeoN
 LqxtL1zQiPBm8ktqLstUdYQm4mL4+lPncyUbNNvIFzKbc2+ZtRqd8vQoAyUCGG0ULr4mTtxnl
 n0i0NF8ANAwhXNAzOoVCwVOiID0NfCzfoVFdkuPCxRVlhJK4Lpw1vZ7++soJggxz5Hp6W36ad
 VxsEhdfUzWS4XaGNFAwHJsSs8DGYFPmwtgwTbAoH851cZ9fkfUNoXGjGPsX5bnNGtcI3UkX0z
 jA/t0HJz6Xrj0nsCUZ31McbWeLey5zD8APhwm0t9zjP1jeaSXCPIjjgAON8+wlIXMHLu1sqns
 WAUBSGkDmHVAqHB5/6H5Va/4Xq3WXG8HOh92Et6DsEIoiT2EbBp+bYtpDF0/iHnge8aORgIhv
 ct8Jq0It1LxEJXGxen9tDOA2Tuc9BXUz/RRB1KgTLdMAVYxWr2V1TuPhlJTA=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 22:33:48 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 22:33:43 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH 2/4] coccinelle: platform_get_irq: handle
 2-statement branches
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

PiBGcm9tOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgoK
SSB3b25kZXIgYWJvdXQgdGhpcyBpbmZvcm1hdGlvbi4KV291bGQgeW91IGxpa2UgdG8gdXNlIHRo
ZSB0YWcg4oCcU3VnZ2VzdGVkLWJ54oCdIGluc3RlYWQ/CgoK4oCmCj4gKysrIGIvc2NyaXB0cy9j
b2NjaW5lbGxlL2FwaS9wbGF0Zm9ybV9nZXRfaXJxLmNvY2NpCj4gQEAgLTMxLDYgKzMxLDI1IEBA
IGlmICggXCggcmV0IDwgMCBcfCByZXQgPD0gMCBcKSApCuKApgo+ICtyZXQgPQo+ICsoCj4gK3Bs
YXRmb3JtX2dldF9pcnEKPiArfAo+ICtwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZQo+ICspKEUsIC4u
Lik7Cj4gKwo+ICtpZiAoIFwoIHJldCA8IDAgXHwgcmV0IDw9IDAgXCkgKQo+ICstewo+ICstZGV2
X2VyciguLi4pOwo+ICtTCj4gKy19CgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHVzZSB0aGUg
Zm9sbG93aW5nIFNtUEwgY29kZSB2YXJpYW50PwoKKyByZXQgPQorKHBsYXRmb3JtX2dldF9pcnEK
K3xwbGF0Zm9ybV9nZXRfaXJxX2J5bmFtZQorKShFLCAuLi4pOworCisgaWYgKCBcKCByZXQgPCAw
IFx8IHJldCA8PSAwIFwpICkKKy17CistZGV2X2VyciguLi4pOworIFMKKy19CgpSZWdhcmRzLApN
YXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29j
Y2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlw
Ni5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
