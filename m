Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE11871CB
	for <lists+cocci@lfdr.de>; Mon, 16 Mar 2020 19:00:50 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02GI0NjO012564;
	Mon, 16 Mar 2020 19:00:23 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 55C787809;
	Mon, 16 Mar 2020 19:00:23 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3927C7809
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 19:00:21 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02GI0Kqc005013
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 19:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1584381619;
 bh=qlj7OTKVjfTZLTBDaA4JFLCd9OIzHYQQIwcftU2tGwQ=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=B7ScYIysWiKrHRpc0KwEOHGJVaBI87aeCPnSo7aeJPqjhvmTooLIjTBFJs30Gxv+A
 iFhuLoFHN2rWwPkrA+rwZZ+ndGzw1MBnftSyMXgpGKVT6leAdy4yTFTbXIrroCs0eL
 GvR1NppPRyI6edfoyf0HTOYcugg2l7GvnyoKr+GU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.93.189]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnS4I-1jnTps3sSM-00hb1X; Mon, 16
 Mar 2020 19:00:19 +0100
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
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
Message-ID: <7b5d7851-b935-7f7a-c07e-3b3dc30ea92d@web.de>
Date: Mon, 16 Mar 2020 19:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:H9nZZB+cs5qNCNCuJhN6QGjLPYm+gRRhrW1VdqFJ0VhWd2iQgYw
 wcHpBq+q96FTdh/KSSGsgyMaui4+G37h8uuaaVRcSpiCxNDN6Qe7apGnGU4irDjUNMAMh1J
 6Wgs+qgHnxR/5JjwTRHxapCAMHdLQKW53d77NwU6BJDfZEjIWVnn29hjiFOVx3+SPO1U1F+
 U3D+bgz4sreoC848jFBxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:03Rad5CtOIA=:DnTaJdzvsUNrD32XnBEmUR
 62tdkFMzUMmzJPs6ILDSX1K06UvTxIko9o0JmKJ0gWmTdQuksOfpFAFRGJKJXm2Z6CRf6JREj
 uWD1jCgWZGH8t84J13sUpcxttl/2XKcZIvBut5sFjxrXmekh2X3Elng4NQY0VSQsHVk+VZDsA
 ow+vEvC+2IzK5LNC5u127HpepeC9bUx1rg0SKMpXMnKwHBHcX/9MmXVBpKq1f/7JzvoflXsAC
 pxxX7+naJ9kcflfxKPW4iURbpH9OtkqdGJDKcZNNjSJ8njBfEmOpookP7iIx0VVOPEU7Vv4zb
 jHyNm7Umh455m4vjAZr1lx7UgQPRMZfCaYk1bG3OIJjPkmrThaULAE7zDQcJAlMq6gj7EqUyN
 l2F7TgExg63sqCrRGJ4hpS2mk22CfS0BSbnP1sWbjCrhjwsWR4PJzDsaIi0J1sKXZOMfxvSBe
 GeR2nk5ud8Om4QybYpKYLVgf9bWELrgZg4dFhXljVF7JbRoD0BxXWuXUGrsL+Sqxes3UI5J7I
 HFOz2nvYOF1Xo4uBwy+MxpRa4FatdJNxcbZNbJhnaTx0BfVr0EaTjGcVU/ca5bQzJJszMNqwG
 blnP3+VNxHYi4E3GBLQcnOkeb1hU+Dpjk18pdZkIjoRKNHD2jwxvjT6Diifu4OKlR76vHzkJo
 dGdzr0fR9W9wCpvNWRFH/cOVhdoa0CafehVm1qdUVFu+fa4ZbmM94mmws8svmJepcOafrD5oZ
 1kcOK15SUbVZwj0oY7EKCh+tNi4yZbvss/QaR7ZBqzLRpve8TSP5LyJ7YsMyXfSuniUj3IUms
 jn7s+yumdWSVvXMIFjWBU01U+nwWkq0t7HXFYNnj0dsCsklGyy+ls1GGat+qfgFMyyXr9cy2I
 G/Kw8xLkBuXIM1Z4SG/1P6FLLYu3wPNdha5yFDxgXAw6iorNN9l3zKrXscziqCA7+K7nts4Lv
 0lOgIc4vFEZJiH2zj1rohRiMwUxx/L0P9nfmoFxQl7D2mOjf3LqCSyVL2vg+ddG+6IjHoJNuL
 yZVaWBUK6NzMYlo5ksvzrVTCfie7ibix4QUOgjZU490ujGYPoUIhI6AiDyEP2pBOQ0pvDGlIX
 oFn/KH+uRcvCsZ0XZxbk98TlZhBUPOWMYcL1DK3zDyf7ceoTmMvY/oGkC8yziWxVA84t14yal
 /n4R0+axmOBgTqPqknWmU9E8R7B9eTyOK8whEqlraqeNCCanPtteIL1z1JXOylUNsGU2trX7i
 XH97gQU2gOP0YEof3
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 16 Mar 2020 19:00:23 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 16 Mar 2020 19:00:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cocci] [PATCH 02/26] parsing_cocci: AST: Add ParenType and
 FunctionType to SmPL ASTs
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

> ParenType and FunctionType are types present in the C AST that
> are not present in the SmPL AST.

Will a bit more background information become helpful for these data types?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
