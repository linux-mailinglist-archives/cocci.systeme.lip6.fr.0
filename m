Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAF1569D3
	for <lists+cocci@lfdr.de>; Sun,  9 Feb 2020 10:39:29 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0199d9bZ015782;
	Sun, 9 Feb 2020 10:39:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 74F2477FA;
	Sun,  9 Feb 2020 10:39:09 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 607747718
 for <cocci@systeme.lip6.fr>; Sun,  9 Feb 2020 10:39:07 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0199d6q0007473
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 9 Feb 2020 10:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581241145;
 bh=IALBKAzfShjoA9TDrXgmKWqMtkWfEvQqfe39Th4MiUI=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=phDzL2nuIeiAIgKldZRE6Y6f2HjjKijpJxm2ou3Xf04j6/IZdRyo161eoVM0PdpqM
 quLsdnrOugLDhqfPaRJ86cW8149cK3gXHPboa2gVNnzSJnvM8/gJJytJ7AXH5/cDBE
 acq5MCXblD7LW5ke6GE2L5q3Y/PmTEP5JwZYfsa0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.72]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWuiC-1j3yiT1i3I-00Vwxc; Sun, 09
 Feb 2020 10:39:05 +0100
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
Message-ID: <08fbbc65-8aaa-e37c-7781-322df052bd9a@web.de>
Date: Sun, 9 Feb 2020 10:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:tijJL3X10GX4ejSSTP0rT0FpavPvfRT3PxvPcBziJi2D7TrrAZd
 /ZAbqb1DHfVnGVPEAMuHXqCHEZsBztq7jEliSgy+DAvb8PXzPB/dDLoii9lbIMpvYAUIKvz
 RlBYH5GPwqT5GhpwnR/Zf++23i0BqYA8yGuXXckiYM+eXOp5YQjFlPBn1+/oE+gK0MQ3JrX
 DqudU+RY0MNMBwS1zAswg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ojvUywl84As=:hAQtaiaMrRAcX92lhhclbJ
 7Civ+Mb7yS1OeG+3G+P66n71KaKRI6J2pVlN5zD4eN4PmH6UGU+BPQDRbIWOsHVTanSrXT+FK
 XXPCk8PWnQQMFzae6CGgjkN1p1zv2qRtTwbftT9knf73jQK5eLOn1azYUJi5J4BL674d5cT3R
 qlbagIMftMbTyHYvVJ5sirurRFCgXJ6aXDnZEYRWyDBuDpL0k5xNrvYK0Ut+CryXBJM3P6KXc
 lt9b4vpBnZgXJpbqEaWu4wnkHXGOh4NPEhHrWhKCSQaBhk/iBHCZS9dD7aK2mncO5ac6KELed
 +rCfgQGFHEgOnbXw0hu9MivyMpgdFKZKBTM2LXoPV9FV5eIDkgLMliy/9+j9k0vXw3qf1f/ed
 4e7gajcBJhjsG/Ea0b9jjcLev2ujX3ip+Lkd33z5cDUW1ipTT8zX29o+lnY93nUdL94ACvDcd
 82CaOz6rAohX8QCIEeBhBydMAl4KNrziUAKUm7bCLkrK6qdhHSA0yZ1/53XzTPnqVCQDxcAO8
 KadAt7WjJdsX/fD6XyELcu45XXEdaQG6GbNkLvzict1KXtitYaGVMOoNkcFfmAVM2e9RLtzr3
 qisBwT1DvN4pqKouEO6werFmS64/+dmErWC96GJj9wIWXEgiXAmWhWqOJ5nmrJqivdUaCTDFA
 fKSR9FDa6YhzCS7hHJ+AgZg7F04Mhhv0LW3JxMh7kxHFDG4rNXxKu/Lec2qFXK3BPfn2B2w1L
 F9tzxsW3fx6V/dlLIMKRtXtcsgeC6sEPI0W8K1evbGfDVCVNOyg5mEjcstEvYWwvg/NSi9L4r
 loWrUi2BsQ+HwLeVDBAm6zJrui4kxiui2NuSeEOum5VA292g0Ha+H8lRWHXTTw7ctkXVSLCBp
 1s0h6cd0eeOY74pSCits7MZ+px2s6ypXpE7LzDzycb7widOdvE2VvWrEHTr5akFen0dGCWwHW
 EOtqRm1MtXVXnSgrkYxkC5xu9LT93hsOFRaTI/9r63KA8h7dwLg2XqAJgxdZU9UZAC2RgxBIh
 dXZqvRp3iLlq+5E+/4S8RIHgYwKZDs7AJwashmicYFDZIgRSANiSQ211Tht8yezwJV4QlLWD0
 5jpMAr/X6xZ/qymY2LNIBSepgqUC+LMw3aEBzBxnbin0bYBlrISd4qFVURXKu6kywpW7jnENR
 fYmv2ZAvGqiMUAXHE7MSnxtDsfehZDmiMEbmpuShPqjqz1ZDKO5/DhljvFMfz/T1bh7dQQDGo
 6wPzNSdC/hxrXvheB
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 09 Feb 2020 10:39:10 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 09 Feb 2020 10:39:06 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cocci] [PATCH v2 1/2] parsing_c: Align C AST and Coccinelle
 AST for pointers
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

PiBGb3IgYSBwb2ludGVyLCB0aGUgQyBwYXJzZXIgY29uc3RydWN0ZWQgYW4gQVNUIGRpc3NpbWls
YXIgZnJvbSB0aGF0CgpJIGZpbmQgaXQgaGVscGZ1bCB0byBtZW50aW9uIHRoZSBtZWFuaW5nIG9m
IHRoZSB0ZXJtIOKAnEFTVOKAnSB3aXRob3V0IGFiYnJldmlhdGlvbgpmb3IgYSBuaWNlciBwYXRj
aCBkZXNjcmlwdGlvbi4KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQVNUCgpSZWdhcmRz
LApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Q29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUu
bGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
