Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09D5F3D0
	for <lists+cocci@lfdr.de>; Thu,  4 Jul 2019 09:35:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x647Y39M005779;
	Thu, 4 Jul 2019 09:34:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C1F7D778E;
	Thu,  4 Jul 2019 09:34:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2ADEE7777
 for <cocci@systeme.lip6.fr>; Thu,  4 Jul 2019 09:34:02 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x647Y0rY001126
 for <cocci@systeme.lip6.fr>; Thu, 4 Jul 2019 09:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562225639;
 bh=cdCMPEXrmvjgoFFOsTMbdlb6IH3R6tYEoVvVQQz7pLA=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=o8dh0thgtNNIAsqXRCnoMwVW20tc5QBznvUiPPv5fNtRTuVXdx0G/WXjWU8u3BPZU
 BYMoDLY9ExvFT1VGtMo0SDsBNiZSn4XmViVziHJBl7U65Z9W47Nlc+Uhy6GOfKical
 3J5fULl+wEOisDnl1seqOwq5SJugcaqgx5ZtS5O8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.138.50]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfRnJ-1iJtd81y7V-00p5xw for
 <cocci@systeme.lip6.fr>; Thu, 04 Jul 2019 09:33:59 +0200
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
Message-ID: <3d2a9d9a-790c-a0f0-f980-b560504babb9@web.de>
Date: Thu, 4 Jul 2019 09:33:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:SIrou3QpDHxDRNUHEWxOubT72BZFgJbvBjGegfIczabVotwj38T
 wnvGsZ/phHWZuCEd66+0cXmJCGNAWBoE6s5KVrghQTWSR5o+JDznZQNkP5BFDjDnBgcsa7V
 AjhF3ltGx+LBGFbNamouJaTpqJwcLpMMIsW0LPtt3hKRT/ypF8WmHEMaJ1zKEZq8ncSchdn
 3JKOPvvuVEhA/JBC8rOzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lsrw4ZJJBiU=:ynlMNAoBaGGRdwyKl6j5Xh
 +tCotBUac/hzDcP6HFmhelzmrWAYSaH6cbye0jrzinsXQjm7FqBXzulYQX33pYRsucla9DOoG
 GJQHB7+hBLoZMnciXSOAAgw49giW+bP1n2db/HG83jjBy4brujZpiD1He/JWaGcFGYFz5If+f
 HdCR0Q/xoioANGJIxZBftylULeXB8dOGfT83/KYSSBxiCmcgxorcyUGyynygZywFMeIQu/n+b
 Bdd27PqNfYiXIeJJGI3ryZw40qEZzUUihWuCGwYfvsxWHF+18qavsphOOnNZgZhdjNCDGmB/P
 XZ5pGoCEYGtFulu+bwQxTA0JvHAUwNc/2K8zB5msZJyZMKq96uVI2oQ18GFuwddulILLP2ylU
 yPt+U8LtE0d1jFMB5NRIacKWh1yGDSiBR3Mc3Bx2q5Qdz3lz3jG+v+XFfxBlVhj5ouSfHbR+T
 N6sSrXnOdqwf8jc+EXehh4b57zIutyBedC50Pp3QFFPsTIcTQY+4uha187yeTiaQ1RHLFOq69
 18265nyZkC9G09W2CXiI6HPIeQgDE/27+un45UUk2xNp84jJzKSQD+NCvUPwjo6Tl0MFWd5IO
 Vj9pDUoLf26z8fYZVzci14bZdWOO5f4V6YvsMP+Xry9mK5tKRn80r54f2fv8/XYiZmKmGIZwy
 bSgYEuCu1vC1rTXgt65ijFG9aSXEhRG+O08cs7Jk4tZd69rausahHkSCHPx6RoFFzdvE6j6rv
 G4exKCBjR7VlSEC6yWDSoPCtpK6X44MPO2nypdy69aRURwQfkqM/1dZbWDGHiZ9xYARcegoyX
 yUXkQRrJzs5z65OuD+qK1vz2e6p3J9mRO8JG8t6CF0dtUdWLZaCv9DZX129pK0E5uykmvCTBT
 EbrQHyEpekhpc6fhuhqNBYviMiQsAvy/p6jy3opAR/T41/omOtUQ75SGkNWXVofpaSJWPzamx
 r84ESwuTXApTLG54VNoUxf7+23x4ROd/QkkpCdS5TM7HDAFBMYs981xndYGzHs0XrLIBffwvw
 Gc22QlGkjz/L6uVjA2zOTU1m9u15qbyYIFWkBGmWF7WtZ/44+ntyy+u0jv+SuZCukE+QOgZa/
 xpPZYKyW34dlBQ58/9i4/GbEzwA09Szbj37
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jul 2019 09:34:05 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jul 2019 09:34:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Pretty-printing of code for ternary operators?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hello,

The semantic patch language supports also to convert conditional statements
into usages of the ternary operator.
How much can the Coccinelle software help with pretty-printing of generated
source code in this area?
Would you like to achieve any improvements for automatic code beautification?
https://github.com/coccinelle/coccinelle/issues/37

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
