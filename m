Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3033456B
	for <lists+cocci@lfdr.de>; Tue,  4 Jun 2019 13:30:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x54BU6f2009672;
	Tue, 4 Jun 2019 13:30:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8C890776A;
	Tue,  4 Jun 2019 13:30:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 688457760
 for <cocci@systeme.lip6.fr>; Tue,  4 Jun 2019 13:30:04 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x54BU2Lc020916;
 Tue, 4 Jun 2019 13:30:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1559647786;
 bh=NnHgDDxEaUqkSvPWPX+0oQ/+pSBWZGwitzJheluK2Mw=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=mPDSv7WSZFG8dhLHsSyw5pOwaTEFX5bb+TIZqiSlb93aa5e4GTSotYzYIh2oVKQY0
 AB75V8//fOmU/r9+gFs9Lx2u0kKrAJ1Annv+uMEAvAev0meV+O9b3Y/8qys7Ta4rxw
 W+LcIpvp//hijcAPN6GDXX8a/+V5Ewyuug7PkV18=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([78.49.105.210]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MRl2f-1hAAfj0ha5-00SzDt; Tue, 04
 Jun 2019 13:28:42 +0200
References: <201906041350002807147@zte.com.cn>
To: Wen Yang <wen.yang99@zte.com.cn>
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
Message-ID: <9169c754-17ef-f820-8335-2015e3c37782@web.de>
Date: Tue, 4 Jun 2019 13:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <201906041350002807147@zte.com.cn>
Content-Language: en-US
X-Provags-ID: V03:K1:AiQPmN/SaFFLT7vE/A+qNDQ75f3MT8Xf8s0QSGsW51uUcsctr5P
 SFtxL3BMfLgv0QA9zqRFBxJ7/ijqKItmloPfrNL3Aj8jFbMoG7ViNS9KcWuXILwyqA1Rxmo
 dQnG1nAhRyxLekLiP7wN9HgVuzWmShDiTg/ELctb2T6IJ6hb/r8SP1TS8Af1SvaCEp+Fv+t
 ZkuFBieoP6YTbX9TazkXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JNG5G7F1lIY=:nWNYDV9VqBWdcg43nH/OOC
 5qfOVYDPL4wUjs1Q9/OWEm9wCvoJFQHFjnEv20vFd6X9Gt82l3zSCW51SazqlS4xrZU7rCBEm
 WEECGC26PWF3XhqrizgVhv/EM2lWUmXzHNNKyJG2vCnWA2BLyZ1UTCeS+1kq+n9a2q09XmAwv
 6SoZ6YTnZlR4vU0sH5ab81h4lSRZKIIa0QqS3pQCOT6z+v3LW4IpN+3/6ZaZFA75XVgu1ZtCk
 MRkB350kQ4H9AxpGqaR2K7vXHJkGqO8L/3Od74GV4tZvzqWX7rKrvl6rnE968ITghI6ZuiEA8
 ea4bmWajVMTAXcYzo3D1qjSCe0hqDlmImRdkBBRK9kAmF8py8TyH+/uLN8mKwg1Zgot9qCrqf
 Lg/mAZjfUmff2+35NL1YIbTTe+0X4T5cbcbgfGsXXr7Czi0DVY1YXZcE4k4C7yJB7uan5b1qt
 hulbKK2MKMmhuZjF0vmqz+hAq6/s5uKRF8myqWxBTPQ1UukspQsYnTAju4WQFKeSXVxgKbdwY
 8zqkYJdQqqvZFGeL6nE+J7EUGRvlm+N/rgx3bz6RDUl3VhugPgqM4iB2JSiaFBui5ml3rJ87I
 CS5ZtByqlnoVY3VNxlflxxIV0YpdqQ+cQYJt47AqyY8iGPjEKsbrPP+SL5J2GwuGkN2XrhBon
 0KuhO9p86EDpZMitGJm/umSGGnkAniONXQGEPAW4N1FNw2XJkVwM+Bvg6DRh3sZenjvs0WIyf
 oeCYXamF8+/TOD4ESQNqrBiUjFwjuFTrB3DHBdLL7GWbn6+7iBPG/g6sOO+SEyGlzIb2rLTOB
 wYpQZ4JvX3cinFzbOAflWnIwrPfoKv+5/jMI/lctwsFhicF4sCqvZ4zXuuq7Vro0DGfQKQkvX
 I5VsNZjdQEowYkKEs1AzQA+HsuYDlOAX2VJ8RYmUWiEKhR2w73c+zZXQ0Lsr3LXBY3l1q59As
 MLpQfGke7po5sNW7HlHCywxGt8B0aNgptelys/159rjwswm2LVIc0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 04 Jun 2019 13:30:08 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 04 Jun 2019 13:30:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] Coccinelle: semantic patch for missing of_node_put
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

> let add_function f c =
>     if not (List.mem f !relevant_functions)
>     then
>       begin
>         let s = String.concat " "
>           (
>             (List.map String.lowercase_ascii
> 	     (List.filter
> 	       (function x ->
> 	         Str.string_match
> 	         (Str.regexp "[a-zA-Z_\\(\\)][-a-zA-Z0-9_\\(\\)]*$")
> 	       x 0) (Str.split (Str.regexp "[ .;\t\n]+") c)))) in

I would interpret one of these function calls in the way
that text splitting is performed here also for space characters
after a concatenation was performed.


>              Printf.printf "comments: %s\n" s;
>              if contains s relevant_str
>              then
>                Printf.printf "Found relevant function: %s\n" f;
>                relevant_functions := f :: !relevant_functions;
>       end
>
> @r@
> identifier fn;
> comments c;
> type T = struct device_node *;
> @@
>
> T@c fn(...) {
> ...
> }
>
> @script:ocaml@
> f << r.fn;
> c << r.c;
> @@
>
> let (cb,cm,ca) = List.hd c in
> let c = String.concat " " cb in
> add_function f c

Can an other data processing variant be more reasonable?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
