Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF39564B8
	for <lists+cocci@lfdr.de>; Wed, 26 Jun 2019 10:37:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5Q8aqV2016438;
	Wed, 26 Jun 2019 10:36:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 816817784;
	Wed, 26 Jun 2019 10:36:52 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3E2457770
 for <cocci@systeme.lip6.fr>; Wed, 26 Jun 2019 10:36:50 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5Q8amWC017526;
 Wed, 26 Jun 2019 10:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561538207;
 bh=rMYHGerP1uaLet6uyMnPrxJ6cxkCg5HH0/S2yqZYMmg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=go+N7xef2qg3hCh80x4vEoSw+5SvmFu+Fjf6SjT+Laa/LT6oKsfYmylYUbLseO66k
 4DPz1S1kkmlIKgJVWuFeTOKn95e8zJpoPxdrRAlYUAillI3zd50EQxMIsgbHgW8iYH
 QE8pYXQawinmes0HsBSmYESJ7ToQTmn5IVnlOjK4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.241]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MEER6-1hmczv1kpk-00FRxZ; Wed, 26
 Jun 2019 10:36:47 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <43dc8f93-4c20-32da-f5c2-6f26bc4ef627@web.de>
 <eb86530e-4d1b-c080-fc7c-341d24acb8ef@web.de>
 <alpine.DEB.2.21.1906251636360.2556@hadrien>
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
Message-ID: <07d5b071-f236-a933-2519-580e29e13774@web.de>
Date: Wed, 26 Jun 2019 10:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251636360.2556@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:qavqxdvyuEGB5DtJdADP6Q/R+yhtpO+Bm7GvsJz5cDo1RF/CsUl
 Pfx3gOIpvKZm0LFWwmDGbfn6+F0YbVimJbGKaSqeuJXUfXhy+nFNotyDrp2GqTeWe5x/hFC
 w1NU4UTfSGDvDBWd0JXYwFnkAnhMFwutOK/yY/efy+q0Vhq1LPVUUe7cvQYAAwdwZmGTWdO
 ZQkBkKeS/Ug5HMkUbLeoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pPdmqh2SSM0=:+AJIKD3k4ZJvKSf89KD7e9
 hhfOa8Rjr3ZGy1O/UrFTZSolHknjeiiocZ1PiB9YWvq67dT9FqIjiidNHW9bZK/RhaanzRcoH
 +DM08Nb23447Pf3D6/c99Y/tWikQg9Bq8vF57dBYX26UaEL4/BI576hIxBHUJgIP7ebFhJcVr
 /gBWWh8fiy74s8t+fhWakuHN6DQ77eNVuNXStXIOteSTiJGHSqAbhXskmNqKCgCTSYQjemkpG
 BjfxNPM2QGhHR4NFWvjq8afHu/s99s74rC5RF5ZDOBSVsRLxTeolzfndUM/Q08GHmkbpUb8+f
 ryBwQG97O6kXWs/9Se76lTqK1s7WlyqIlqZfTNQwy9U8AbbO3CJ2vMqbpYZZC9lprDwyRojhd
 7T69e9z060WWn90KGuxXy3klEN5zaimmsSQcpofNonSb/67c2Jk6cz7ET8Ghe8aVFH7fl6Hyo
 Ez3JWb76QAtnSO2rIRzjJ8opCmximCaBHFy5fX65CKupP3EFBOnnbPKHaCymHwUZ3qLIWUgXE
 2tqtUtYtIY2uhukSCpJDbrCv7tYkF+ceCn0Sd4KMVKgx1ojekzVLwbzBXj+eYwHWK0RgQw42h
 2OrkyhvsjN8OnTjwVZwtUV+3DHARiOY6F5EpPeVGPXDpbz97aP2xlcAxrnmenYv0zaLwx58Yl
 mOyzGJrjXWW0wBNF81X9ulvli4eJIjIveW5UgjGHgtpz4hOAZvriDzqOPHd/9tWE4mjgJ3EaQ
 g79OQDob0tCX7TqygOIJ1Tpw7+Ap/4f9xdNYircfdu/qjZDeTqCgs8LjyiORHGhKNlkN4P2ww
 X6O40YyNcB7aa4XzMP1MSfvWkrmVsLOD6jG80BZ08h7vk/9rlD1xfMHLr1LMEjXoY+0lxQvf5
 xZQu6EMbgZFuqkZ1HdHIm3kfpzDre+LE0ui+bc0CGHK6L89MMlf7OMFT3ErdNEb0gK+K2xSay
 8fFOj3amA8PJX6wlFj29zO4l59K5KJ68Sqg4mNcU6nWL4hxztAjuwSahblQ7mvKazREqETj2t
 OgOH8eIR+SRXwCrLaQOTQ/J9jT8agaaZCIT8fIb+M4TpBS3YK9MORMCpt1JfiStDroVVwVFNc
 wIf0Ksb8e17wMoU6F+uCJfJRd6fD8GvEndq
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 26 Jun 2019 10:36:54 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 26 Jun 2019 10:36:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] More precise distinction of types for source code
 searches?
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

PiBAQAo+IGV4cHJlc3Npb24geDsKPiBjb25zdGFudCBjMSxjMjsKPiBAQAo+Cj4geCA9IGMxOwoK
VGhlIFNtUEwgbWFudWFsIGNvbnRhaW5zIHRoZSBwcm9taXNpbmcgd29yZGluZyDigJxBcyBtZXRh
dmFyaWFibGVzIGFyZSBib3VuZAphbmQgaW5oZXJpdGVkIGFjcm9zcyBydWxlcywg4oCm4oCdLgpo
dHRwczovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9jb2NjaW5lbGxlL2Jsb2IvYzZkNzU1NGVkZjdj
NDY1NGFlYWU0ZDMzYzNmMDQwZTMwMDY4MmYyMy9kb2NzL21hbnVhbC9jb2NjaV9zeW50YXgudGV4
I0wxNzkKClRoZSBtZW50aW9uZWQgYmluZGluZyBhbmQgaW5oZXJpdGFuY2UgY2FuIHN0aWxsIGJl
Y29tZSBjbGVhcmVyLgpJIGd1ZXNzIHRoYXQgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUgY29uc3Ry
dWN0cyBjb3JyZXNwb25kaW5nIGludGVybmFsCmRhdGEgc3RydWN0dXJlcy4gVGhlIGFwcGxpY2F0
aW9uIGV4cGVyaWVuY2Ugc2hvd3MgdGhhdCBzcGVjaWZpYyBtYXRjaGVkIHZhbHVlcwpjYW4gYmUg
ZGlyZWN0bHkgcmV1c2VkIGluIHN1YnNlcXVlbnQgU21QTCBydWxlcyBhbHJlYWR5LgoKCj4gKAo+
IHggPSBjMTsKCkNhbiBpdCBtYWtlIHNlbnNlIHRoZW4gdG8gc3VwcG9ydCB0aGUgZGlyZWN0IGFj
Y2VzcyB0byBhIG1hdGNoZWQgaXRlbSBhbHNvCmFzIGEgY29uc3RyYWludCB3aXRoaW4gdGhlIHNh
bWUgU21QTCBydWxlPwpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHdvcmsgd2l0aCBiYWNrcmVm
ZXJlbmNlcyB0byBrbm93biBkYXRhIGZvciBmdXJ0aGVyCmNoZWNraW5nIChvciBleGNsdXNpb24p
IG9mIHN1Y2ggc291cmNlIGNvZGU/CgoKPiB8Cj4gKnggPSBjMjsKPiApCgpXaWxsIGFueSBTbVBM
IGNvbnN0cmFpbnQgZXh0ZW5zaW9ucyByZXN1bHQgaW4gdGhlIGNvbnNlcXVlbmNlIHRvIGNvbnN0
cnVjdAphIHNwZWNpYWwgbWV0YXZhcmlhYmxlIHR5cGU/CgpXaWxsIHRoZSBzb2Z0d2FyZSBzaXR1
YXRpb24gZXZvbHZlIGZ1cnRoZXIgYXJvdW5kIHRoZSB1c2FnZSBvZiBzdWNoIFNtUEwgZGlzanVu
Y3Rpb25zPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIK
aHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
