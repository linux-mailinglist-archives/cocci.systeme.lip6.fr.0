Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D4B73A
	for <lists+cocci@lfdr.de>; Wed, 19 Jun 2019 13:41:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5JBf56n024081;
	Wed, 19 Jun 2019 13:41:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 556C4778B;
	Wed, 19 Jun 2019 13:41:05 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 11166777F
 for <cocci@systeme.lip6.fr>; Wed, 19 Jun 2019 13:41:01 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5JBexhq012943;
 Wed, 19 Jun 2019 13:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1560944459;
 bh=gG+RgEvcqfc/AEdronsKjCekGtwFcUPW7C12PVQP1Ow=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=Twmczr/exxpDQJ9UFHm4cbixTQ0kWj/b6SG+j95XgEUH27hUgD9/iU7g0N98ezW55
 CEU+z9Gn1OFVE+QExpLS9lyGVY+2rCBAUhEBlshQhjPy4bY1YYrej71/KhJKhtzbbI
 8D7b1nj/zc+I/Yg/OMi1Zaw/JXD6FixEfVp3skj8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.141.240]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M2IuS-1iVf5D27BE-00s9Pe; Wed, 19
 Jun 2019 13:40:59 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <f9e28910-d42b-cdea-31f4-1b084db33023@web.de>
 <bbf7e602-0a78-9595-31b1-b4dc70195df2@web.de>
 <alpine.DEB.2.21.1906170747030.2965@hadrien>
 <20258ea9-f69b-a0c2-01ed-e3ee8681bdf0@web.de>
 <alpine.DEB.2.21.1906170807290.2965@hadrien>
 <f66261cf-b6d1-5b2c-7756-a17585cc0ce6@web.de>
 <alpine.DEB.2.21.1906170830240.2965@hadrien>
 <c5a19a87-4948-196c-4f74-872c207061ed@web.de>
 <alpine.DEB.2.20.1906170938530.3699@hadrien>
 <edbc59ca-2c16-bd0c-df27-ec2b9983d0e7@web.de>
 <alpine.DEB.2.20.1906180936090.3707@hadrien>
 <c375e3ba-d197-8c78-0797-74505b534208@web.de>
 <alpine.DEB.2.20.1906181932030.25567@hadrien>
 <8080bdd8-74d4-ad15-0ff2-c65219d572a8@web.de>
 <alpine.DEB.2.21.1906190843070.2687@hadrien>
 <8d56d773-2b91-3ed0-385c-cb2e8c3c3d72@web.de>
 <alpine.DEB.2.20.1906191010530.3726@hadrien>
 <3cf8ba89-83d3-fcec-3c3a-11f507a24424@web.de>
 <alpine.DEB.2.20.1906191223350.3726@hadrien>
 <0497ec0c-e9a8-a058-355c-4ba90295075d@web.de>
 <alpine.DEB.2.20.1906191321480.3726@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
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
Message-ID: <1f9a691a-bedb-8cd0-8292-62228f732ff9@web.de>
Date: Wed, 19 Jun 2019 13:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1906191321480.3726@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:rss0uA5/yFRyCgrjyblqj90KKalodeRtQ3BJCtgnfZL+Bj73h/z
 8TcTPirkWDYiU9IbJc5m+jwKh7DX+dXFCAyTBK4XzJOlSzQvIswpn6BJQUiYtd7pV5iHaML
 /NBvUqDibuuiGSJkzfhPW4IJ1QX2r4UVvPkI9a6FsuWLbJyVEyz5R6mCwA2vc9bTpMUeioA
 +aMtrIdgQIMthIXLEmZqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gnLLV+e8jcU=:6yYXxE90klYzEi5rphscxH
 L2jJQogvk81DthaT0roI1cYE1Gv1hFmUwpt7OABlLoDhcPlklaljaVFsOkbumJtVBE5niuaDE
 Dbxv7RzZ1HODq4FWyIee13VoTjBrO/aSzXgR+b9ivUhNb7YNqE7447Mv89+O0XaqjzASS+9q0
 vWnRf2XUp7wIlZ5fsVhVqTYl//9Fbl9WNh3mJEoDOmGhs14NrjLIx3KHeQ6cwl/XW4rLfRO9Y
 w5xJeWftXt9UmYqSf82ScBkQ2/PaDXZsXZb6JCzDadgoBA+3/0yRzBKMrj5YuRrl6PiU7YZj4
 03N3LuF5Y5ZZuqbvWX4VNNG84L53HRfcylQCDiaI7P6JyqPXjMfs3C7jWVsvQ1FzRwWqvs43Q
 8WPnGlkkMwoHvgM9rtHmGxfMUwChTa3bYowIgN2SKfrl/UaqNBMQcV8PIChguD7icY8oJ9yef
 G/cmP3P6Su6xaehamEyhRaJWWaYYIf17WS9jeOFK0nptGfRok9V/iaez3sJMnZ8BnDaBD6IXr
 7AigU0apO63COBtqIo71NapDv1Bxvju30TIyQ4kL9yo8jtUgMEgwM9xF1/VWmitvrXHexytsc
 DF5P9bOo9qXrZXdJOVVq8pWzTaJBoDAKmV/oD+6RahVFHurNltGbGDGo+W+DSwS8DCAXVJLJB
 PTM9KtqFjPeji/uR1O5+g9KhA7SbqnS02+Wce/j8xhlXxUyANzbqddB7+ViazsSyNV3CBeZZd
 bxy2lGN5sxD5CL2AIUd5Z7fz28MLuKcm8BpUx7ZpqUEgs+oVbkYBylhkTViyl2fS55DLxf/S6
 xZNAenWsFoz/f5IynNAvKIiSdJuugfCo/BvWFQoPyBQnSGO3kiWX7I5OTNWHD5fHQ/qTh4mtS
 +hqx474ESBkDUYyQAh4E7rQ9huqsCIMNMjW4OzlSyyGFSkXJzLGAeDmdnsPGnR5YzZA4eI9aQ
 1+NWJaBH7J77WhXEd6XiMR02gNqSQBxUBdxrhAvBtK259/cvonZSZ
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 19 Jun 2019 13:41:05 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 19 Jun 2019 13:41:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Handling of pointer expressions by SmPL
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

Pj4gV291bGQgeW91IGxpa2UgdG8gYWRkIHRoaXMgaW5mb3JtYXRpb24gdG8gdGhlIHNvZnR3YXJl
IGRvY3VtZW50YXRpb24/Cj4KPiBOb3QgcmVhbGx5LiAgVGhlIGRvY3VtZW50YXRpb24gY2FuJ3Qg
ZGVmZW5kIGFnYWluc3QgZXZlcnlvbmUncyBpbWFnaW5hdGlvbi4KCldpbGwgaXQgYmVjb21lIGhl
bHBmdWwgdG8gbWVudGlvbiB0aGUgbWV0YXZhcmlhYmxlIHR5cGUg4oCcZXhwcmVzc2lvbiAq4oCd
CmFsc28gaW4gdGhlIFNtUEwgbWFudWFsPwpodHRwczovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9j
b2NjaW5lbGxlL2Jsb2IvY2FkNGMwNzA1ZjllMzdmNTAxNTMxZTEzM2QzYTQ3YmM1NmVkMGNlMi9k
b2NzL21hbnVhbC9jb2NjaV9zeW50YXgudGV4I0w2NwoKClRoZSBmb2xsb3dpbmcgU21QTCBzY3Jp
cHQgdmFyaWFudCBjYW4gd29yayBhcyBleHBlY3RlZCB0aGVuLgoKQGRpc3BsYXlACmV4cHJlc3Np
b24qIGV4OwppZGVudGlmaWVyIHptID1+ICJfem1hbGxvYyI7CnN0YXRlbWVudCBpcywgZXM7CkBA
CiBleCA9IHptKC4uLik7CiBpZiAoZXgpCiAgICBpcwogZWxzZQogICAgZXMKCiptZW1zZXQoZXgs
IDAsIC4uLik7CgoKZWxmcmluZ0BTb25uZTp+L1Byb2pla3RlL0xpbnV4L25leHQtcGF0Y2hlZD4g
c3BhdGNoIH4vUHJvamVrdGUvQ29jY2luZWxsZS9qYW5pdG9yL3Nob3dfcXVlc3Rpb25hYmxlX21l
bXNldDMuY29jY2kgZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19hcC5jCuKApgoK
ClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8v
c3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
