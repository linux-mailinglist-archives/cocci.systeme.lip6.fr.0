Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF34CDC4
	for <lists+cocci@lfdr.de>; Thu, 20 Jun 2019 14:31:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5KCUVia019269;
	Thu, 20 Jun 2019 14:30:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 41A99778C;
	Thu, 20 Jun 2019 14:30:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3162D7778
 for <cocci@systeme.lip6.fr>; Thu, 20 Jun 2019 14:30:29 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5KCUQcF023311
 for <cocci@systeme.lip6.fr>; Thu, 20 Jun 2019 14:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561033826;
 bh=rUDEkCGBj28NmoxnNsi5SE4+JftS29Nsim1va/8+hQ8=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=hpnYrC8TCRdkIjS/DcsZJ0GKGItpqc4IjmSy8OVFqEYy5prRyqoFz0XOvBoPPKClc
 zFO4lBmBEIr5Ra+7p5Z9LehTXdHzpClJjupD8FtykEBWzWkPY2wlMWeUhlOFHSCcJD
 jR/aTDWSeTl9gp+tbH5/kZYmzYqmJwUMKZbUI1XU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.128.109]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MASfy-1hjwkK1gV8-00BaHu for
 <cocci@systeme.lip6.fr>; Thu, 20 Jun 2019 14:30:26 +0200
To: Coccinelle <cocci@systeme.lip6.fr>
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
Message-ID: <f1bb347b-7318-f69f-ad86-bd633c72b375@web.de>
Date: Thu, 20 Jun 2019 14:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:J+oDJyXGAELWhv/qdgJKkDajxdDzdGwV3jXGmYqTGJuHvtqf8ha
 9lmuNw5p1Cks2Onaq6FgjWKblme0Dkq4hxEpPt1Nfi7z/VnQE2XGNT6voph8G5D1a28bjxV
 RMqRLSlfBqBxovvGYG8ux2y7lxhhdufB7T8c0DUzcNdSyUFDUvLYn5MzIIXeBcFwiv5fhRF
 CWc8a4/TlMxT9pb978iiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mAFHolYaBM=:sFPEqwilxIKUDpDn5nrtN9
 XD3WtZCLppcVC/bog1eC1raGcw9b6OX13e+xRSULUxw4QrxcKvLSmhHh7pqRUrEK4uMO9jYkT
 Y6QAJA1vOBNimT+CqNx5QWU5E8ajS4B/fWMf4yl9lkx6n4W8S06psQ/GSa/SfsiESVZUwcUPl
 ht30UGQG2JzKPFivfR4NmCqwBsPVfrsbpOBbA76rQ8fon2ixN1uPaeGzX+P4LR+5bSQUYgaPg
 cvjW6gM80aLe13VpDNKS4qTFuV1oHgv/CW2ulVSbeu9ZAaSLyvnzYz2RSmOWR1H6hjzvfoVBf
 eW7js3qpdAAlnp1MlraA0wyTu3cnaVMsOK+QmB40+Uq7NWZqHv5NI5AMUAlIiMfuqpaupHU7Y
 koltEL4DWJ5U7rgRmzebscAWMGTXJ6LMkMbjJD94wlIX94vCAbkvXwlZB4nL8rr62xDFgwdqB
 1PbWziMzqeyhufL+ZTak+f1AuwvuUJxrZdCll+miGBI6fmvIUFHNvQnvtYEfnWgLmeF83N6Bk
 YtZAtZMUhZn9nRlmZIgf/qN1zQK/EAtjmq1+PcJzs+zmvZdCXroqt7re4GnKnqlBcWiYMPHYF
 ZML0x5iI7wiVx8XqCrIVO9dPda5WHEfLlZPdErx+oGLuaQqE0I8vvqpRt7QwPi1DtBneq3eLV
 W2TpyQPomz9FRtz/hIYEjBVz0I4CxpI7sdSjffKDH+gNcsQHmiR0ADtT95reGZ0nun1CC+YBa
 70OvYEJIW7aOCjvrt+d3nwuaWiiP9KFjgB4eKtONQAejf/mjJYt3qyi9wJwK6XfomC6Ub34mS
 mlZ0b1VEGjoiKX3lnzxMS4QuqaAe2GCS7G270dA+utNy1JJGiyLEjmr3m9t+VXA09XDZDgKkR
 qvbO3xBxI3zUKqSUo5JIf1RQec6MWsClRqo1apE47g8+Lnc/nnkMjYT41d62DXNBDv9O/zFiq
 DTYZfv0Dlezj640+qZjlVGNs6NlbAeYcqxYZlizSDDPtI9ibCbmE6
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 20 Jun 2019 14:30:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 20 Jun 2019 14:30:28 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Checking redundant variable initialisations with SmPL?
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

SGVsbG8sCgpBIHBhdGNoIG9uIGEgdG9waWMgbGlrZSDigJxbbmV4dF0gbGtkdG06IHJlbW92ZSBy
ZWR1bmRhbnQgaW5pdGlhbGl6YXRpb24gb2YgcmV04oCdCmNhdWdodCBhbHNvIG15IHNvZnR3YXJl
IGRldmVsb3BtZW50IGF0dGVudGlvbi4KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8xNC8y
NjUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwODg5NzEvCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA2MTQwOTQzMTEuMjQwMjQtMS1jb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20vCgoKSSBob3BlZCB0aGF0IHRoZSBmb2xsb3dpbmcgc2NyaXB0IGZvciB0
aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UgY2FuIHBvaW50CnN1Y2ggYW4gdXBkYXRlIGNhbmRp
ZGF0ZSBhbHNvIG91dC4KCkBkaXNwbGF5QApiaW5hcnkgb3BlcmF0b3IgYm87CmV4cHJlc3Npb24g
ZTEsIGUyLCBlMzsKaWRlbnRpZmllciB2YXIsIHdvcms7CnN0YXRlbWVudCBpcywgZXM7CnR5cGUg
dDsKQEAKKnQgdmFyID0gZTE7CiAuLi4gd2hlbiAhPSBpZiAodmFyIGJvIGUyKSBpcyBlbHNlIGVz
Cip2YXIgPQooICAgICAgd29yayguLi4pCnwgICAgICBlMwopCgoKZWxmcmluZ0BTb25uZTp+L1By
b2pla3RlL0xpbnV4L25leHQtcGF0Y2hlZD4gc3BhdGNoIH4vUHJvamVrdGUvQ29jY2luZWxsZS9q
YW5pdG9yL3Nob3dfcXVlc3Rpb25hYmxlX3ZhcmlhYmxlX2luaXRpYWxpc2F0aW9uMS5jb2NjaSBk
cml2ZXJzL21pc2MvbGtkdG0vY29yZS5jCuKApgpleG4gd2hpbGUgaW4gdGltZW91dF9mdW5jdGlv
bgpGYXRhbCBlcnJvcjogZXhjZXB0aW9uIENvY2NpbmVsbGVfbW9kdWxlcy5Db21tb24uSW1wb3Nz
aWJsZSg1NikKCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRoZSBzb2Z0d2FyZSBzaXR1YXRpb24/
CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczov
L3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
