Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F5AF714
	for <lists+cocci@lfdr.de>; Wed, 11 Sep 2019 09:42:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B7gMs3018164;
	Wed, 11 Sep 2019 09:42:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9696977AA;
	Wed, 11 Sep 2019 09:42:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 85A9D76D9
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 09:42:20 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B7gKxa028590
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 09:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568187739;
 bh=R0zUXi2emnACt/hA2bLZfNRV3UeTjUWwVjifhgcktTc=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=bIfKv+fbZ3EjIjYCn1SPHfHBhy8DYkKfg8wdL+ACbogDouANuDyRi6GguzrAWuV6N
 NnmPbP8HNqIDH/Hpg7beioV6m9QEZyPSN47+IvT4ZCb0orr1fEPLd4tEkg1bOxK4jG
 +AYXjB0hwFjZtIJy8Zqg8Nno1iOc7/333E2aqjr4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.183.158]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Mb8sh-1hp3jc2stn-00Kg3a for
 <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 09:42:19 +0200
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0477cddd-0bbd-7e16-adee-91e7e9d3b5d4@web.de>
Date: Wed, 11 Sep 2019 09:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:IFvCjA1Iqp63Q5H3rd+UZVq3GjxwwxRm9tH5BI/PHnxUvgYhUT0
 SpYvakEtiIPCX5V51c7AX51ny6HLW0w+HgIYpiHzLs/yTRKz10BQVjUG8c6kSDunnIKGz19
 co9yFkMl6ufukrUPsb/5Nt7r8FmbzQ4UDGPMD9mWSSHlubEeI3yniie5kbyN3IS4CcM6DhR
 RvZl6jqu2O1p497WTHs9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oawkyDMcb4U=:MJHdla7oK/+7GBJybYiMn7
 7Q97vrpbhP0J9NSX/USt/QdDImviE+72zwASxZmLZQ1nLBJUpxoRSEaXITNtWNtZqJX0nAlK5
 X1J6XtisbaecdsCdpsxG30LgLMKOgcSjMvLqWRjlwnNUB4DVfWW6W7vg6GfApZSlnBujq819P
 xOrLO1n+ulFt4CXiSykXUooshLhhs0ircRSynCIYnRmcxFTyCI99rfQkp0WeykwIFzrMbqPlt
 7g7QdjyqdiyeRvOA9AgCuRKtnoN8sbcj1pwaFrdKGnQzSIeMQR+sRh0/CnxdT+eOyMEqW1GIG
 QLTvYUEVm+VTPDXOm72fqsWva3pltAeipKlxNJG6leboBlcXXP/yS43cCpwPAdMxZE7h+bl+Z
 mSQ11OfKafy3pQSOeVme1hptoqKUONZ5I4tOCMIKZ6V1UiKjOQuGCJgDz6lk5NDEZgua4mcSS
 Zi/+txGU9pUaHxR2YcEeKwRYBDqHKpY3b598dbet8s6ZOIPqfnkwJkPLFRGptSXGie9nU8Xf8
 yV2GdilIAWyWNaoS4yIaTcQxi5v78gJ/w8drMvKcAVVc8ViQbOEIL1Mgd4Q1kPivuQjXtmYQ1
 a5R2a4UqjEdBVtLhZjzXjYO8Wl2DubkjLwncRI+j7ufPA7Z1B1jp/BSMwxV4nIrJekws52bmb
 EeS5Z0TtORJ5YjB8v0B/QZBFoSEvLgYIEg6lnWwxVEs21b9m1QdlSYLrmdWD0/RPGM0YMWkho
 Gv8OOehRcjirC8HwMq78T1z1dH59XjbYtVj4E7vmU0aR8veMvndt3gmLt60KXQUQ0FapgmXsQ
 QYzyTk+yqwlehSDbt47stGGlJUXVeLnwQwhGm4KJ8h79CJmwPQF1nkLn4WaKiToV+29zn9Yes
 RSS9qttK1rvvvCjZ0kL1/xgFxPSzeh0FD0awEKSq5PdlheGghtgcOMmVOk0D7zncYjw3fKiQC
 GqjRWHxgl/gnFlP23IusNoHiAkiSRlZ5QZxv9sxgVJBA6HJO5S/fcIhAQ/abroh0WaykxE+cw
 dVwiAQvzca7LDY+k0QIR2VF4b14x0pLJANuOxO6vrLm51f3xuN+1XSmbK8KsAz3IO+q7yUisn
 V0jZWQzC+0RRDbJq1Bzi7TtZikSmHslLpV8LCKBxLfzUeZ6jmBD4chU9jg3dSfFvi+c3XSz9Z
 t6hTBhKCc9otZx9aqqafyKz3aBUHGQwlblsEaH9/8NnWGkqzRtSdKW2HcQljvezLps8yz1fWx
 QnDbYk4x5k1HFPKOL
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 11 Sep 2019 09:42:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 11 Sep 2019 09:42:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Checking parsing difficulties around SmPL when constraints
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

SGVsbG8sCgpBIHNwZWNpZmljIHRlc3QgY2FzZSBpcyBhdmFpbGFibGUgZm9yIHRoZSBzZW1hbnRp
YyBwYXRjaCBsYW5ndWFnZS4KaHR0cHM6Ly9naXRodWIuY29tL2NvY2NpbmVsbGUvY29jY2luZWxs
ZS9ibG9iLzU2MGMzZDAyZTIwODVlODNlOWJjZDQwODQyZWVjN2U3NzQxNDAxMzEvdGVzdHMvbmVz
dDMuY29jY2kKCkNhbiB0aGUgZm9sbG93aW5nIGNvZGUgdmFyaWFudCB3b3JrIGFsc28gdW5kZXIg
b3RoZXIgY2lyY3Vtc3RhbmNlcz8KCkBleHRyYUAKZXhwcmVzc2lvbiB4Owpwb3NpdGlvbiBwOwpA
QAooc2l6ZW9mKCooeEBwKSkKfF9fYWxpZ25vZl9fKCooeEBwKSkKKQoKQGRpc3BsYXlACmV4cHJl
c3Npb24gYWN0aW9uLCB4LCB5LCB6Owpwb3NpdGlvbiBwICE9IGV4dHJhLnA7CnN0YXRlbWVudCBl
czsKQEAKKmlmICgheCkKIHsKICAgICg8Ky4uLiB3aGVuICE9ICh4KSA9IHkKKAoqICAgKih4QHAp
CnwgICBhY3Rpb24oeiwKKiAgICAgICAgICB4QHAKICAgICAgICAgICAsIC4uLikKKQogICAgLi4u
Kz4pOwogfQogZWxzZQogICAgZXMKCgplbGZyaW5nQFNvbm5lOn4vUHJvamVrdGUvQ29jY2luZWxs
ZS9qYW5pdG9yPiBzcGF0Y2ggLS1wYXJzZS1jb2NjaSBzaG93X251bGxfcG9pbnRlcl91c2FnZTEz
LmNvY2NpCuKApgptaW51czogcGFyc2UgZXJyb3I6CiAgRmlsZSAic2hvd19udWxsX3BvaW50ZXJf
dXNhZ2UxMy5jb2NjaSIsIGxpbmUgMTYsIGNvbHVtbiAxMSwgY2hhcnBvcyA9IDE3OAogIGFyb3Vu
ZCA9ICd3aGVuJywKICB3aG9sZSBjb250ZW50ID0gICAgICg8Ky4uLiB3aGVuICE9ICh4KSA9IHkK
CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczov
L3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
