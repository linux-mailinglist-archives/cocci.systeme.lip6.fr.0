Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B3479C3
	for <lists+cocci@lfdr.de>; Mon, 17 Jun 2019 07:45:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5H5iU6d024544;
	Mon, 17 Jun 2019 07:44:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F1ACD7779;
	Mon, 17 Jun 2019 07:44:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CFF4B7766
 for <cocci@systeme.lip6.fr>; Mon, 17 Jun 2019 07:44:27 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5H5iRQN025735;
 Mon, 17 Jun 2019 07:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1560750267;
 bh=gWF5xsDmEVp0bJbOqqZra/nwVcr0+XzP8iYdlHfKHEo=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=FdxPMOubwWRfoOVn2+KEUZRRrBOI5WjaXAjZ9dLfYIxS54LovIzeLo06U/LaD+daO
 jeIlrYHi41KTcLnijQN3niVKD5S5CV9whh+3OesvxpGUf/PJyPfOJH/I0FT3KHWVka
 ekC4h9EwcgunNlWnDxlIKxqTxBCHU43Hcy+jqEes=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.164.208]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LvBJK-1iby3s4Bec-010J7E; Mon, 17
 Jun 2019 07:44:27 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <f9e28910-d42b-cdea-31f4-1b084db33023@web.de>
 <alpine.DEB.2.21.1906162214390.2537@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bbf7e602-0a78-9595-31b1-b4dc70195df2@web.de>
Date: Mon, 17 Jun 2019 07:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906162214390.2537@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:eZeI5ISmjJH1VEJtNNzaY6lvJBaJCPRT7PToyp9zyPlGsqVPx42
 B/y1ODM2QqAmEv3HaWQoVFEY/b9njnOscw53gfcEupjnvYZgnZxqev0qAlYPSfZkArn9NQ9
 g0lwqgTHzStBNhBlII04QqbPSh+ZiiuJgTfrL/EfHLPUcqf+5PWI3Z2qpiMdbSaQOevFXKd
 fBb4aFcseZA1zYGFA3JUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:neJ4Vl0vae8=:L/B7iusEnQuxvpov7ghUZw
 ZD7M0uKhIDpRTtADODjHTPjwqieZ7HCjxkfZIkK9ejVTDpUGXQEJzy1mojgmy3d0V1H8jWDEX
 kFqEaSomcb3mB+rA26ctOo33fWSYuKmOaCAdNNLEB/zej4plhslAOYQnM2vE9jv6VAX1p5vH2
 QTxULsx1lIKH23JWoQ+Z+kfK6i8ZnHv9x5YJf94PPQXptN2I8ZVH/Ai8FnNz9PyXLVDHnddEE
 qfUnHR9Tnu7G0CHOtPi+eG7RX6DKJOzlik9F7qLnRNlMEkhWAQTzLJWIfEHPHF4TsjEfyodeH
 jXqXzhtV30i96G7x6qtdWiyewfoka4ocUE77OuTEzvlxU87pD6Ga230IX4DGj0L3PnGKAdTTZ
 rTNRmpfn4IrQmWHllQGkJq0/i0RpS4Wvr9HD+yHAqxVdT2fwyaIGikY8M+W4iu8zXR/FGwR7+
 rWdKCpAqwcA2ObkpYNd6wSf8UQutF5GIXuz2bIAgG4FH9U0hPMlnlDasun9AjwpvaSYZtE8Ru
 By4Knh9yE/4oHn9kmQxY3URlIG5YgACbfxGVcnKJjaFvV3g6ScXqJrkHlQBioRAzg9ikNmjok
 goE118CrJF/1vmz1cDRP3cSld+F8LDaAubaOPdzMf4tqTlygA7vb1XLfoKDKqWtQb+VrvsVNg
 CfxtrswZ83XNaCz1CaenMXX0gsoeRyjAYCj+XPqQki1OJPDn5XGaLM+KvbFq89eEEpMrQuHyN
 wDXOrcJn1OIHLV4UpIosPUJAgA3r1n/jk78rMpPT2BLHGmx7KF/aBkdKpC4ePzdznllO96h6H
 qRalqLxjDfT55Y+Ow9R4aBxvuj0f01Xr3TQmPTH2ATC67r/cDRmb/jl3Yo/U3LA3tBy1QE4WN
 iPCBEQ0WUGaXg1DbOnM/JY1mc5Zrqmb0kC3GLQi/5OBPDBkLKEW2EHNdnrpVoHVXffJsDwnpZ
 b2/FCcMLynxGuIp//vJ7uHWX9VbBSsLFPExchzwuLQeRdzmsWPROB
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 17 Jun 2019 07:44:31 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 17 Jun 2019 07:44:27 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking for a null pointer with SmPL
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

PiBJbiB0aGUgc2Vjb25kIGNhc2UsIENvY2NpbmVsbGUgaGFzIG5vIHdheSBvZiBrbm93aW5nIHRo
YXQgZXggaXMgYSBwb2ludGVyLAoKQ2FuIHRoZSBzb2Z0d2FyZSBzdXBwb3J0IHBvaW50ZXIgZXhw
cmVzc2lvbnMgYmV0dGVyPwoKCj4gc28gaXQgZG9lc24ndCBmZWVsIG1vdGl2YXRlZCB0byBjb25z
aWRlciB0aGF0IGV4IHNob3VsZCBiZSBjb21wYXJlZCB0byBOVUxMLgoKU2hvdWxkIGFuIGlzb21v
cnBoaXNtIHNwZWNpZmljYXRpb24gbGlrZSDigJxub3RfcHRyMuKAnSBoZWxwIGhlcmU/Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9jb2NjaW5lbGxlL2NvY2NpbmVsbGUvYmxvYi8xOWVlMTY5N2JmMTUyZDM3
YTc4YTIwY2VmZTE0ODc3NWJmNGIwZTBkL3N0YW5kYXJkLmlzbyNMMTU3CgoKPiBJIHdvdWxkIGlt
YWdpbmUgdGhhdCB5b3Ugd291bGQgaGF2ZSBnb290ZW4gYXQgbGVhc3Qgc29tZSByZWxldmFudAo+
IGluZm9ybWF0aW9uIGlmIHlvdSBoYWQgdHJpZWQgc3BhdGNoIC0tcGFyc2UtY29jY2kuCgpUaGlz
IGRhdGEgZGlzcGxheSBjYW4gZ2l2ZSB1c2VmdWwgaGludHMuCkFyZSB3ZSB3YWl0aW5nIGFsc28g
Zm9yIGEgbW9yZSBjb21wbGV0ZSBzb2Z0d2FyZSBkb2N1bWVudGF0aW9uIGluCnN1Y2ggYW4gYXBw
bGljYXRpb24gYXJlYT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5s
aXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
