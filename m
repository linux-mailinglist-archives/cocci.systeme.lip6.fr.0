Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F809C366
	for <lists+cocci@lfdr.de>; Sun, 25 Aug 2019 15:14:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7PDDDWV000035;
	Sun, 25 Aug 2019 15:13:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6D631778B;
	Sun, 25 Aug 2019 15:13:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5D13E7694
 for <cocci@systeme.lip6.fr>; Sun, 25 Aug 2019 15:13:11 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7PDD9Y0004402;
 Sun, 25 Aug 2019 15:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566738788;
 bh=nJMc4OGbip+3o9qJCHueDkA9Rmefb84wTEfqz4SWVI4=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=SoHCfe3rncAX+OxX+Du5k5pX/RTiRmuJ4rftX+QHWt9ESNrgIZ1h/mQiydwuu8mhB
 z9b1AY7t5ZCK5kt2w9qyaBaWPPIWSfGXe1CFyrwzenRwcJVI1Chsl4iTHAKKQHEmw0
 Jh6adEe67mR9XDZAW54dDKvNBGuSLtJMwzO2zdMw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.160.204]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LbIiI-1iToYI2yBW-00kvVh; Sun, 25
 Aug 2019 15:13:08 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Julia Lawall <julia.lawall@lip6.fr>
References: <a7f12c28-0f96-d388-f1f4-57db4d3d880d@web.de>
 <2AE15A09-F219-43DC-81A9-73C13CFC0753@lip6.fr>
 <661aa3dc-3514-3d75-eb3a-9e46843fd02d@web.de>
 <alpine.DEB.2.21.1908251547420.2283@hadrien>
 <c6f15b8d-561e-fda4-1531-191334f1142c@web.de>
 <alpine.DEB.2.21.1908251741460.2366@hadrien>
 <3d06c34b-ad1b-2d5b-f36a-0de6429ad361@web.de>
Openpgp: preference=signencrypt
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
Message-ID: <ba5ad931-38a1-ffab-6730-2bf5b9981203@web.de>
Date: Sun, 25 Aug 2019 15:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d06c34b-ad1b-2d5b-f36a-0de6429ad361@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:ll1ra1pyeGGQh03IHdGqhdooIw4rrKq3m8qcm8pECGlZih9n2xt
 kV27q33gaifb52nGpqyUGkmPZ1G08OaJBPZp5BCkwpQN862NGjIR7nVeCAg/Z+0iVAtGrWd
 /CcwtMc1+a2wUZQjYjM0qHpD92xc7RxzFC6kOEumWbCuKJf9jjz5DBPE6niN08sUDuFczSE
 HAfpLcMJCUrAaiWGr8gTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1srN/RKmcGg=:usjggr3Q0a8x9Az4au/ELT
 VV2axPcAmvOq5caTxAQNMDnY89OzovdbHQZAogb2xcsAyBO2JzUjL3bXQFNcz8sOtthWvAeoV
 AX+c3+oziJRx1BdKrWJ6QXJSuNDgBKkRiSBwQUHhFBclcuAVDQCQMSHzXPvLJT+sh2v5Cz2lh
 gxMXwt/mLSKyPRWBFU9hKgGlo+yAEXvRY4EvOcJFL7apxistwrG6cmyele+AcC2yn5qyqXpTE
 VvAqv9IHAY4xEFndluLAfCO+AWMiH1VfcTLS9RLgts9Re2vC4RRLQfnpcdU07lF2UCDE7kjSg
 fh4VyD4J0uMbGtTuYIguHu3PE9Esuy9nBmta6FowoU9iyXa+v6MddsPUUACsdWpVwbtSCK81H
 La4Zo5gDPciAnW1VQ2p9P4b0tvmioQ7DXLaAlDhW6BlMH9XPMh0dA9nZkZ80VNuCyYi3dISS2
 AGKQk0XQL5/UqH6nOS3qKo2kvD6XxmcMohP/OJ0YyDyecvjRitgPlCVux93uHo80owtseIK2e
 545eFA1r5ww8ikrH8iMjOQZrfVbR52nR7Qdz298UopbxpQuB1u47FE5aJWQEO8iL+X6vM3C/N
 PlDACKmjyfV5wdIHc9JqR+2Xg7f4M2fpu+/de7xlY9RbCyXsAa00wcU2C6+/RH6WszPx0/Lxc
 QALpbniGG45vIk4Rg3WvFCRsX4kKnQCv6A5pBQ4PZNDz/pyoOBy1gpXed4g1VCdz+jY698PSl
 dtVvoaB0SZWlX9RV8bkO787ALGGz4cnV8GSgQmAsiHf0q5fblEE6DZgID8HQW0aMEbLzWrqEL
 HYqkTZ01Pu8giFCMH9HTw7Nhe4NI9/A5XZv5vcp9FonJH8GNri3PvLDuMj4M8kI+KLRJH1nkZ
 Gu6mq5C/sUwZV+oPVBjz/SlQHsCz7d1fC5pZloiQLG83yds94JFey/afrsfxI9Mch7hzIfV4/
 AxoUDvr7XKQxQIeGbQhiSOqu58tiEatnRtvU7txRxWwXOgD9/lPsxUgKVxCZZ3RuOX6jLoGiY
 5TMO8up+SoHwaOO+rP+RwxCw0iQQIAmVJuvVgKgn5mFtlP1Uw7TdsMdVDmnetA0j5Dm7j5wKh
 UTYcoCTxqg41mUWlUVGuhLiJkd62DC4SbCASL8LAjTiBmI64NhqHrTL1kSxvxHWXQwalQicT9
 MYghU=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 25 Aug 2019 15:13:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 25 Aug 2019 15:13:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci]
 =?utf-8?q?Checking_information_from_=E2=80=9C--parse-cocc?=
 =?utf-8?b?aeKAnQ==?=
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

Pj4gVG8gZm9yY2UgdGhlIDwrLi4uIC4uLis+IHRvIGJlIHBhcnNlZCBhcyBhbiBleHByZXNzaW9u
LCB5b3UgaGF2ZSB0byBzdXJyb3VuZCBpdCB3aXRoICgpLgoKSSB3YXMgdW51c2VkIHRvIHRoaXMg
dGVjaG5pY2FsIGRldGFpbC4KV2lsbCBzdWNoIGluZm9ybWF0aW9uIGJlY29tZSBtb3JlIGhlbHBm
dWwgYWxzbyBmb3IgYSBiZXR0ZXIgc29mdHdhcmUgZG9jdW1lbnRhdGlvbj8KCkkgYWRqdXN0ZWQg
bXkgZXZvbHZpbmcgc2VhcmNoIHBhdHRlcm4gYSBiaXQgbW9yZS4KSSBsb29rZWQgYXQgdGhlIG91
dHB1dCBmcm9tIHRoZSBjb21tYW5kIOKAnHNwYXRjaCAtLXBhcnNlLWNvY2NpIOKApuKAnSBhZ2Fp
bi4KSSBmaW5kIGEgZGlzcGxheSBsaWtlIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb25hYmxlIHRoZW4u
CgrigJzigKYKKSkgZXNlbHNlIHsKICAuLi4gICBXSEVOIGFueSAgIFdIRU4gIT0geCA9IHk7CuKA
puKAnQoKCldvdWxkIGFub3RoZXIgZGVsaW1pdGVyIGJlIGJldHRlciBpbiB0aGUgb3V0cHV0IGxp
a2Ug4oCcKSkgZXMgZWxzZSB74oCdIGhlcmU/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNv
Y2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3Rp
bmZvL2NvY2NpCg==
