Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8C1AB08E
	for <lists+cocci@lfdr.de>; Wed, 15 Apr 2020 20:22:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03FIMPtY022964;
	Wed, 15 Apr 2020 20:22:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6EBA37830;
	Wed, 15 Apr 2020 20:22:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B528B3DC8
 for <cocci@systeme.lip6.fr>; Wed, 15 Apr 2020 20:22:23 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03FIMNIO013784
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Wed, 15 Apr 2020 20:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586974941;
 bh=2J9F0HJ2BWPgXxx+de+1IsSV5GPcKsfoWGauYXJCLcc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=QfLjl0yxKh2TRChwMo4lZui2ddMvCd9vYlAcy64tA+nSSa55RLHaaazSGovBN308C
 rNUH9Caq+vC9SQn/02rz+OZSEDWkF/l4hse3oerbwdm574CNONWu5C41Db1DO/shmC
 c9vN8u5lYOTfRUHUaosNINV+qRJNEKXDfOXI4c2s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.133.192]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtnzN-1jEiYC0vOn-011BaY; Wed, 15
 Apr 2020 20:22:21 +0200
To: Julia Lawall <julia.lawall@inria.fr>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
 <alpine.DEB.2.21.2004151949230.2381@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e8c198a7-ee26-4637-2d21-977d9db60c77@web.de>
Date: Wed, 15 Apr 2020 20:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004151949230.2381@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:w1+x07zSny5fvB3Wa3hs0R2ts9nz7OqG1rlf/ZV5PVvYnAqpeKz
 QA95G1S+MSBry+K+S2xECQNEJme0NfQcTwyv996PniTcwsHKxzxLk7+AevTH0hQpCTc9UVy
 BPQ8CYnfdNFfdWZGOnYVoa3DgZjGKERlTmZIEu9Qeq9f4oGUgSrDY9JehCmNpUX46PhiAKf
 8H9fCSyM2ivmVS0S+5K/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0yWdQFzGy6c=:IzcNC9sM4knUKwwmSKLzut
 xYkOIqpczlYqrFCEbrkHC3x6OGntESteDEcgNG5Xpg9gXGygAyHeAHbx1edLmkoc1qwT6JEJl
 fauA02cBi6QN3ynoimhy+DGY3XnFOw7DUBp5dsDup7AAw6kDNy2SuuHxgAs9FfsPvYpGR9K86
 UYad4yNkLCIwweGjCz2iBGlQ6Fau1CndJQTASSnZ9jaP1kXn2iuiF4A0KJB6wUDF5+nIwywyu
 iDXXBiAB6SW/i4MyTrF3lYKoH/3xqp8abqeDy+8xk+chg38QKK69EHGki4D8dQNertMIPK5Zf
 0GwFclExsEWY79moDjxc9aXjvEImBDm/K0JspdIC6fcwSKCscN7js8NNt9PVbvEkUqZP/SvwY
 OBSeoVf2KKvN6ewnm4J+qLvIZ+A7AehKB5yFA0sluND4dIsIXkdtY0ahLVhFtKYKXrghPDU29
 HUHaBtlspgLcrxHbhgCLJr8Cz+0fTbNBYM+GVXSvekBTCai3bGD7sE8NtkLfcJdvhPSelGCsL
 ztEFYgyzX+no6d0ItfgkktfymHqDZDUDAzQfag3POe+mcRCp0SncM5PYaZihJ/C27XeCq4ZBl
 gDKQvcrseDWfctUhCh+nPeJQKgPDErnq1WLljjKRjpFWT8AYHTtMuhzf6j+0+bxd8ZInXg+DE
 h3kwMnZA8Mt61Af4YN0Mkt86UEsBi6MJEJcKl92Gm5yJAnOtcBT8lkwYb3cvQw8Jh/pAJ52wS
 O+1/NjlvL0MjAmmmOmnFUK0qJiZHaXp/IzpM6gzlR9eWEVpgl6usUZFYlWxvGD8oxzFisC3Lb
 5zyQILTHnJFQgEjI7DsA5BiVmPA/MbTuB+oD1sXDVpHN3DGNEK38wDiE+FuyfrPiU/TtlOb1r
 68m6XVkEWYtEOlsJw0hZcA4YBMmvnOcFLylYxWOGeUdXMpcTqvdn9azIOE2ctYb13PFo+8PuV
 SChFaVb65NuG4kJbOZlOsPkOHI9SMZGpBpL6R/72JVNs1TdOuoJA7AaiBnakvt7dHPGp0aNvJ
 Ys6WgVREjLkmQxaWefKcaDfnWOKYEnLcU8ApyVVvdqqdVGiM128ADxypM2ZfjPfYgCdUOfsC5
 vHn/edEQ9y8r9pfbOHJzvPo/CTxP4Q/vFNwuBGaOEfSNX/ou7do1ZMwbzwv7XReiCavgVvXDo
 rOm4wQ5404DdzwjgZgAFc+MdKbQu2lBxDeel+q7Qz+Gs2rdxONM+HFfRrbBooHLNMQtWMxao5
 N8+rTGe4OEcKjNP6I
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 15 Apr 2020 20:22:26 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 15 Apr 2020 20:22:23 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Dejin Zheng <zhengdejin5@gmail.com>, Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the replacement of two specific function calls
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

Pj4gc3RhdGljIGludCByY2FyX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+PiB7Cj4+IAlzdHJ1Y3QgcmNhcl9pMmNfcHJpdiAqcHJpdjsK4oCmCj4+IAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+PiAvLyBkZWxldGVkIHBhcnQKPj4gCXByaXYtPnJlcyA9
IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+Cj4+IAlw
cml2LT5pbyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHByaXYtPnJlcyk7CuKApgo+PiB9
CuKApgo+IFByb2JhYmx5IENvY2NpbmVsbGUgaXMgbm90IGFibGUgdG8gZGV0ZXJtaW5lIHRoYXQg
cHJpdi0+cmVzIGFuZCBwcml2LT5pbwo+IGFyZSBwb2ludGVycywgaWYgeW91IGhhdmUgbm90IGdp
dmVuIGl0IGVub3VnaCBlbmNvdXJhZ2VtZW50IHRvIGxvb2sgZm9yCj4gaGVhZGVyIGZpbGVzIHRv
IGZpbmQgdGhlIGRlZmludGlvbiBvZiB0aGUgdHlwZSBvZiB0aGUgcHJpdiBzdHJ1Y3R1cmUuCgpU
aGUgc3lzdGVtIGNvbmZpZ3VyYXRpb24gbWlnaHQgbmVlZCBhbm90aGVyIGJpdCBvZiBmaW5lLXR1
bmluZyBmb3IKbXkgdGVzdCBhcHByb2FjaC4KCgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGVyZSBp
cyBhbnkgbmVlZCBmb3IgdGhlICogaW4gdGhlIG1ldGF2YXJpYWJsZSBkZWNsYXJhdGlvbi4KCkkg
dHJpZWQgb3V0IHRvIHNwZWNpZnkgdGhlIGRlc2lyZWQgY2hhbmdlIGJ5IGEgc3BlY2lmaWNhdGlv
biB3aGljaApjYW4gYmUgYSBiaXQgbW9yZSBwcmVjaXNlLgoKCj4gSWYgdGhlIHZhcmlvdXMgZXhw
cmVzc2lvbnMgYXJlIG5vdCBwb2ludGVycywgdGhlIEMgY29tcGlsZXIKPiB3b3VsZCBoYXZlIGNv
bXBsYWluZWQuCgpUaGUgb21pc3Npb24gb2YgdGhlIGFzdGVyaXNrIGRpZCBhbHNvIG5vdCB0cmln
Z2VyIGEga25vd24gcGF0Y2gKZm9yIHRoZSBtZW50aW9uZWQgZnVuY3Rpb24gaW1wbGVtZW50YXRp
b24gd2hpbGUgcGF0Y2hlcyBhcmUgZ2VuZXJhdGVkCmZvciBjb2RlIHZhcmlhdGlvbnMgZnJvbSBv
dGhlciBzb3VyY2UgZmlsZXMgYXMgZXhwZWN0ZWQuCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0
CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xp
c3RpbmZvL2NvY2NpCg==
