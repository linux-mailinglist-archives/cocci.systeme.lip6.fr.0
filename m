Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC3101A91
	for <lists+cocci@lfdr.de>; Tue, 19 Nov 2019 08:57:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJ7uhV6012138;
	Tue, 19 Nov 2019 08:56:43 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EE90877DB;
	Tue, 19 Nov 2019 08:56:42 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 80B1124C6
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 08:56:40 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJ7tnMf020281
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 08:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574150149;
 bh=I00TNxNtgpGgxmtRzMDjw513i0Eqjd9hgbSdW9ll2Eo=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=adUWlv/APSQh1C1YaXdLKAQWwXQomygFUV4hK2pwV91cffkXFC5w6LPaLNOrksw6s
 ZJNPQaZADF7KviFEIQGzWXv+zicszUJuHmL5YQvkxBGny1ivhHYEgVWaWaxtyzsdhQ
 wies4dgRqMcEOjvrDqfAmuWCdcdHifSwgHKiZIk8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.93.164]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MTyDl-1iNvyG1sZN-00Qnmj for
 <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 08:55:49 +0100
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f3f054d2-538f-afbf-3a79-6d73cff32ced@web.de>
Date: Tue, 19 Nov 2019 08:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:n8q0xwocVe+8tYz+A+U+hpfcQUuihbTqKFdpkDsaa1p/OQToR6d
 kGKC1S6gKBR4IuGDASapcKMGYZZIvuboN0qA0U7Cj9ROHSQUskL2sHLH3P5CLzp5Rfv1xO4
 QTjS82tOmT6lyWQMLZgtHDgjp5b+6cQ3H7BGNHY7B950WctWbMeWpH9nUyCUK2U9hcj3GY1
 d/59o6Pf/KHuueI4LjOAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yTYcOv+lYEA=:jfAk6iHXIfs3z7Bz+1dA06
 WiQPxS0LPToH+IPDS1IUgpCe86o6iTrrLl2VT1NBRIQmYgu6DULFVhjDyPxyJDTHejN2LveXU
 pTOs/GikhCOC6parFA1fzCDJLP33pxNrrOgC2ONN45uxlNdPiSBWCUxu7Fvnde8K84KNIDZW3
 lXlolIa3SAXhZ2YD/GpVMKuiIVGncQusvDUw98i7CGmLag+OpM7lJJxN4BOdf5tpHIWFd3JZo
 xuaiMop2y++5XlOguYUU/let2w5Syjw+tJRNqGoIE5wt5ki3kaYj86JXmNb/xHNqbGqZdCcgU
 hkgqefs9SdEMxNDOj2oudf3WCzfQ7GPbZOXfqeXuHJ6du7aJVVKhPrRwLvMvaBMGO7UesNGtp
 DOVbJdsYt365fwzxnqPHtNqyo5ShmryOiVRioG37CqMBsL7wUlPm+VgRJ0nqkAea0xpyg7qkd
 DxZw1Xsn7kJOMlR67Now4gp5OlcgyK4bXeyTgNTPOb0RNBrj2eBuia909J62mpkTUkzH+UFkm
 Q/aqiUyRGgGEIBMBqHE0DkZkPL156c55kHGIW8T4o65UGmBhWmstCFe53JRnyvWgWBbUvrPRo
 bcxNap1gd8jy6kkvQyHMeZiNZ6ylyhAYvS0BHfycY3chESM5tud/30evoDt1ywv6W8gAjOA6l
 7CIKgfqjp9OQc03pD7FaLsASjhsbB9T51U2ukmrJF2d/rzH+TDOFCXF05qMZp1ex4tsgk2Z2z
 T90iEo9Q/GjssLNQGEb95rkj3y/7kuRJjt3XjIRlj1yIqOw3p+ugq9xAWKvP3Pw5TGrMNRI2M
 7Mr2CXKm0kFgcmyD9h3T2uyDNE885tLCyCujPKo+++7qCtSDy8IdgMFdfgfJL7CI1CzvJDbxz
 Vky8ZOMr8bUbzDw67eDdRvRSMHWpgzzINwSyrWNdZtxclxujt0Gygn+8O8RHXxFD7kxFkgorZ
 xl6ak9RGEHK6QL6qlBZ4Ya8K0YxpJD0JjAF4UHy1yDF9dVFa2BpNFR314xIQuYcf0ws4d/x9V
 YE8tt0HChouTLolFTtYKh1YNYq+bb9Wc9fx19ZFfWOPlfyy19A/Tfy+znHAJMN4Am4jlpXwIC
 8bq9cBFn0vVdxP/HzIHhlVlAvGXfxWQgFiypTFLol2n3ob6KzQ+Gi+V01od0A2lobHRgC4R0x
 YGaeSfG7z1IwyX2HFfsp+JwllrAq0GbRR4wJRX7NOxLlqGa3SmKwcXjBlMSRy6HPJWIGiYT4E
 b90bcPJCYj9qFlefDLB13UIUOv+S36Z1Q2dg6IW6jjCy2v56pjTw4Wwq8Qng=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 08:56:45 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 08:55:49 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] =?utf-8?q?Improve_parsing_for_=E2=80=9Csha1dc/sha1=2Ec?=
	=?utf-8?b?4oCd?=
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

SGVsbG8sCgpJIGhhdmUgdHJpZWQgdGhlIGZvbGxvd2luZyBjb21tYW5kIG91dCB3aXRoIHRoZSBz
b2Z0d2FyZSBjb21iaW5hdGlvbgrigJxDb2NjaW5lbGxlIDEuMC44LTAwMDA0LWc4NDIwNzVmN+KA
nS4KCmVsZnJpbmdAU29ubmU6fi9Qcm9qZWt0ZS9naXQvbG9rYWw+IHNwYXRjaCAtLXBhcnNlLWMg
c2hhMWRjL3NoYTEuYwrigKYKYmFkOiAjaWZkZWYgRE9TVE9SRVNUQVRFNQpUWVBFREVGOl9oYW5k
bGVfdHlwZWRlZj1mYWxzZS4gTm90IG5vcm1hbCBpZiBkb24ndCBjb21lIGZyb20gZXhuCkVSUk9S
LVJFQ09WOiBmb3VuZCBzeW5jIGNvbCAwIGF0IGxpbmUgODA2CnBhcnNpbmcgcGFzczI6IHRyeSBh
Z2FpbgpUWVBFREVGOl9oYW5kbGVfdHlwZWRlZj1mYWxzZS4gTm90IG5vcm1hbCBpZiBkb24ndCBj
b21lIGZyb20gZXhuCkVSUk9SLVJFQ09WOiBmb3VuZCBzeW5jIGNvbCAwIGF0IGxpbmUgODA2CnBh
cnNpbmcgcGFzczM6IHRyeSBhZ2FpbgpUWVBFREVGOl9oYW5kbGVfdHlwZWRlZj1mYWxzZS4gTm90
IG5vcm1hbCBpZiBkb24ndCBjb21lIGZyb20gZXhuCkVSUk9SLVJFQ09WOiBmb3VuZCBzeW5jIGNv
bCAwIGF0IGxpbmUgODA2CnBhcnNlIGVycm9yCiA9IEZpbGUgInNoYTFkYy9zaGExLmMiLCBsaW5l
IDEwMDAsIGNvbHVtbiAxNiwgY2hhcnBvcyA9IDQwNDg5CiAgYXJvdW5kID0gJzUnLAogIHdob2xl
IGNvbnRlbnQgPSBTSEExX1JFQ09NUFJFU1MoNSkKYmFkY291bnQ6IDQK4oCmCgoKVGhlIHJ1biB0
aW1lIGNoYXJhY3RlcmlzdGljcyBhcmUgYWxzbyB1bmRlc2lyYWJsZSBhdCB0aGlzIHBsYWNlLgpo
dHRwczovL2dpdGh1Yi5jb20vZ2l0L2dpdC9ibG9iLzQxMjVmNzgyMjI3NDljYjhmYzkxMTE1YWJl
YzNhYzgzZTVkZmIxOTQvc2hhMWRjL3NoYTEuYyNMMzkwCgpXaWxsIGl0IG1hdHRlciB0byBpbXBy
b3ZlIHRoZSBzaG93biBwYXJzaW5nIHJlc3VsdHMgYW55IGZ1cnRoZXI/CgpSZWdhcmRzLApNYXJr
dXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kg
bWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5m
ci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
