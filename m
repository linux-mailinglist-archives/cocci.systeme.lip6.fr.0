Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13974FBA7
	for <lists+cocci@lfdr.de>; Sun, 23 Jun 2019 14:49:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5NCmMCU001589;
	Sun, 23 Jun 2019 14:48:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D90AD7780;
	Sun, 23 Jun 2019 14:48:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9A99D7761
 for <cocci@systeme.lip6.fr>; Sun, 23 Jun 2019 14:48:19 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5NCmGk1025335;
 Sun, 23 Jun 2019 14:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561294096;
 bh=4FC+oLtOrl3T2NI3XIB5RbImALUdNxc2qd8MNU3CNxw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=jOWa6OtSrj+pHgflpSa0nk+C+Czt7gGNoq9llpu/rjZhV3j1uSgkJDvESpgTILF6/
 ENntdja5bd51R6v1NlToHximG87vY6OlQF9hhwHdj/ELTuVq/+DHyTtyoPwayExLjv
 xwCVN/dhnCtRHNbKPy+5HlGFkPXQIthbFhFQ2j1Q=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.32.213]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9Xfb-1hjfxA46Tn-00Cxv3; Sun, 23
 Jun 2019 14:48:16 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <f1bb347b-7318-f69f-ad86-bd633c72b375@web.de>
 <alpine.DEB.2.21.1906212251430.2538@hadrien>
 <9d2ef926-62b9-d182-d6d6-cd82ca13173f@web.de>
 <alpine.DEB.2.21.1906221517080.3253@hadrien>
 <4dfb9359-ab09-d206-3110-0fd177ba34b3@web.de>
 <alpine.DEB.2.21.1906221555220.3253@hadrien>
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
Message-ID: <5f436d79-b510-b0a3-d11a-d92b8d175f7f@web.de>
Date: Sun, 23 Jun 2019 14:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906221555220.3253@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:hOdcIsWacsi+MzZIzXJ9Rvh4mjmlskgnDOfahoAi2ZWC1F6eZRd
 HMoYA/w5hNliVzk+27IfOsgBAmJ63kQ20M5dEaSffJFc6ZN4rJJQaJj6WfHYQ7m1KzQdQg2
 2INgHrfSSGgm4PdRD3hQoY/r0M72EB1Qd7issHJZcSNcmejx2MMe1FnxU8RplcXeittN2vx
 fDSnSRDph/tydP+Y6TbRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6pA6f5C6e2Q=:bx95SRNs+2nDaEIMBy3f2q
 qzIa3DvUXiWExpbTg8RZL8kChysOAGyuBsML6axYwNPLAykzqGybagspyzyEMcMQbOxwuAdSi
 nZpXtS5W6Lz72E5I32n9sJIPffa6dSER56EAz7IMRkpOyWfc86etgf4yEoymELX0bNhQZ30Yi
 eJPK4vAZmRC5+2R+QuAmcCLrWpEyvzVHo+roDub4XuLBguEukpcx3ESh4LEv37d2B01gN5HSp
 o4WUlNDZvjBD5FMY0KyrstGXkzTASLPd/Na8s43znALjUdSGKo5vUiV37O5SqpdDC7ueJFpC6
 BJJado0p4TDKD+AikLOOpeWnnAUocOPeF6D3jT7fSnCjYUC33kS9O3UUrPo8sJ5VxRlM4o3r3
 x1msvNOCvrHrSzdqYTDT6YTzYljb7XY1aal1kTIQoO5B25tv2Q2hYqbHaRhzYojjTbhtGmGMt
 T4u0E/iNQgPbYvTxeQi3nEiq2go2I+GGy0C2KQ70bIfBtKmzt0Z3HA9CYNzHs1kvacT3Hrg5g
 rdzhcEtfPCalEyXU2aCu+ssetctoJ/F4h6vAvhwZo2UFhnInO3QIk1L6kkSsw36BpPn2YqCQH
 jSaUYDas3pHeFAtCAuiXBDWRvTBICkgrRS/yU6iJA4we1++3kYs1Y751MlP5UEZ4nRq6vec52
 qoqLVQmMmwlwJK7EOyeWULI3NIXFP5joqGiECR0zXQmiNI5OqYwPqzE0bApJ30ZQx9G1E+Rba
 IESwDE8nH6tCHDTNL9xLG6ssR4TYPcu3aMPMm0LqAhvjE31n9TvJlRV3qci/DeEB3GKlVct36
 3Bz3G94bY8TMU+qHsVVSLrpNDx0JWEWh0af13N2AsEqNLvFtbqJOaPX58SrZUehm/a7fHvBwC
 RplGanZ6ObVfERQ0kQUaH9VJVZ3DVZQFn7YXNq7L7lswCy7/7duaPpOBajcUAL9/A4AM2uSUN
 xW6Xi6Ees+LrAmhp8sdR0lAKwa1F5DF6VbYDlHqbAHAjM89h557IK
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 23 Jun 2019 14:48:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 23 Jun 2019 14:48:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking redundant variable initialisations with SmPL?
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

PiBZdSBjYW4gZG8gd2hhdGV2ZXIgeW91IHdhbnQsIGJ1dCB5b3Ugd2lsbCBnZXQgbG90c29mIGZh
bHNlIHBvc2l0aXZlcyBpZgo+IHlvdSBrZWVwIGl0LiAgSWYgeW91IHJlYWxseSB3YW50IGEgc3Rh
ciBvbiB0aGUgZGVjbGFyYXRpb24gdGhlbiB5b3UgbmVlZAo+IHRvIG1ha2UgdHdvIHJ1bGVzLiAg
VGhlIGZpcnN0IHRoYXQgZmluZHMgdGhlIHBvc2l0aW9ucyBvZiB0aGUgcGxhY2VzIHRoYXQKPiBt
YXRjaCBhbmQgdGhlIHNlY29uZCB0aGF0IG9ubHkgcHV0cyBhICogd2hlbiB0aGVyZSBpcyBib3Ro
IGEgbWF0Y2hlZAo+IGRlY2xhcmF0aW9uIGFuZCBhIG1hdGNoZWQgcmVpbml0aWFsaXphdGlvbi4K
CkkgaG9wZWQgdGhhdCB0aGUgZm9sbG93aW5nIFNtUEwgc2NyaXB0IHZhcmlhbnQgY2FuIGJlIGFu
b3RoZXIgYXBwcm94aW1hdGlvbgpmb3IgdGhlIGRlc2lyZWQgc29sdXRpb24gb24gdGhlIGRpc2N1
c3NlZCBzb3VyY2UgY29kZSBzZWFyY2ggcGF0dGVybi4KCgpAZGlzcGxheUAKYmluYXJ5IG9wZXJh
dG9yIGJvMSwgYm8yOwpleHByZXNzaW9uIGFjdGlvbiwgZTEsIGUyICE9IGUxLCBlMywgZTQsIGU1
OwppZGVudGlmaWVyIHZhcjsKc3RhdGVtZW50IGVzMSwgaXMyLCBlczIsIGlzMywgZXMzOwp0eXBl
IHQ7CkBACigKIHQgdmFyID0gZTE7CiA8Ky4uLgogaWYgKC4uLikKIHsKICAgIHZhciA9IGUyOwog
ICAgLi4uCiB9CiBlbHNlCiAgICBlczEKIC4uLis+CiBpZiAoIFwoIHZhciBcfCB2YXIgYm8xIGUz
IFwpICkKICAgIGlzMgogZWxzZQogICAgZXMyCnwKIHQgdmFyCiogICAgICA9IGUxCiA7CiAuLi4g
d2hlbiAhPSBpZiAoIFwoIHZhciBcfCB2YXIgYm8yIGU0IFwpICkgaXMzIGVsc2UgZXMzCiAgICAg
d2hlbiAhPSBhY3Rpb24oLi4uLCB2YXIsIC4uLikKICAgICB3aGVuICE9IHN3aXRjaCAodmFyKSB7
IGRlZmF1bHQ6IC4uLiB9CiAgICAgd2hlbiBleGlzdHMKKAoqZTUgPSA8Ky4uLiB2YXIgLi4uKz4K
fAoqdmFyID0gZTUKKQopCgoKQnV0IEkgc3R1bWJsZSBvbiB0aGUgZm9sbG93aW5nIGVycm9yIG1l
c3NhZ2UuCgplbGZyaW5nQFNvbm5lOn4vUHJvamVrdGUvTGludXgvbmV4dC1wYXRjaGVkPiBnaXQg
Y2hlY2tvdXQgbmV4dC0yMDE5MDYyMCAmJiBzcGF0Y2ggZHJpdmVycy9taXNjL2xrZHRtL2NvcmUu
YyB+L1Byb2pla3RlL0NvY2NpbmVsbGUvamFuaXRvci9zaG93X3F1ZXN0aW9uYWJsZV92YXJpYWJs
ZV9pbml0aWFsaXNhdGlvbjUuY29jY2kK4oCmCm1pbnVzOiBwYXJzZSBlcnJvcjoKICBGaWxlICIv
aG9tZS9lbGZyaW5nL1Byb2pla3RlL0NvY2NpbmVsbGUvamFuaXRvci9zaG93X3F1ZXN0aW9uYWJs
ZV92YXJpYWJsZV9pbml0aWFsaXNhdGlvbjUuY29jY2kiLCBsaW5lIDM2LCBjb2x1bW4gMCwgY2hh
cnBvcyA9IDQ5MgogIGFyb3VuZCA9ICcpJywKICB3aG9sZSBjb250ZW50ID0gKQoKCkkgb2JzZXJ2
ZWQgdGhlbiB0aGF0IGVhY2ggb2YgdGhlIHR3byBtYWluIGJyYW5jaGVzIGluIHRoZSBzaG93biBT
bVBMIGRpc2p1bmN0aW9uCmNhbiB3b3JrIGFzIGV4cGVjdGVkLiBTbyBJIHdvbmRlciBldmVuIG1v
cmUgd2h5IHRoZSBjb21iaW5hdGlvbiBjYW4gbm90IGJlIHBhcnNlZApieSB0aGUgc29mdHdhcmUg
4oCcQ29jY2luZWxsZSAxLjAuNy0wMDIxMS1nZWFhMTNkNTkgKE9DYW1sIDQuMDcuMSnigJ0gc28g
ZmFyLgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0
cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
