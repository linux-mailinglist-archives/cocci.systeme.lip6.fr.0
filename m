Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4359D9B
	for <lists+cocci@lfdr.de>; Fri, 28 Jun 2019 16:17:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5SEH6Ra014502;
	Fri, 28 Jun 2019 16:17:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DFEE17786;
	Fri, 28 Jun 2019 16:16:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A2271777B
 for <cocci@systeme.lip6.fr>; Fri, 28 Jun 2019 16:16:42 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5SEGL76010492;
 Fri, 28 Jun 2019 16:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1561731371;
 bh=EhlgD4OxUpSkqoFWG7/7Dq7I5UiCGhuvGXHoYj+a1Gg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=goNqNhx49UgMRSN92Xeb2jyW+yTv2nUxqhP9G0ChNWb/I6nhEwnLzJqw/mV5WcL+T
 5BeUzezljKRWZE/OEXU0PoQzmYR8ZPmVSKNGb0RbVUO2tIGQXSVk+Vbyq3tWMrOQDo
 5FEVyClw5i+FXM+UlaQN5oMMYC9M9YfMwtYFcy/w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.53.73]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LvBV8-1ig5MG3ABe-010Hx6; Fri, 28
 Jun 2019 16:16:10 +0200
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
References: <1561690732-20694-1-git-send-email-wen.yang99@zte.com.cn>
 <904b9362-cd01-ffc9-600b-0c48848617a0@web.de>
 <alpine.DEB.2.21.1906281304470.2538@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <223dfac0-deab-0525-fd5b-ccd2350fd5e2@web.de>
Date: Fri, 28 Jun 2019 16:16:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906281304470.2538@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:y53BM6cdr0iYY/gExgJ05K4r7XD9WgGNmrmhAUw0kUUbxPTOPng
 oocuNl1AL9rnpB4RcnJddIchPItUg2BWk5rz4qmVGGt/57oaEDdVCLwfcnFZ3gIcInfKIis
 KjLoDjZpX7VTwpROKOxLEHhYrq8N93kn4PJ6/rHYVC4lMRjytKfyw22FiR4NDSNeRGlQFZW
 mZUgsAtKHUzXjQ4P/EPfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uJj/Q0Etm4E=:qeoodpNkCi/PKbSZTJ3IRn
 qkxovJR+RcXS6VeIZs3DroaPWsJUVwAdgW4arXlsPhdnD0dWpLfaQaIYoX9gDhyqUqPK5Ue3w
 cxkA6yhyJesW7W3xRqq2vlz/O4YVnFpaDzLp5VJhr46s0r/JGNufHgoT1u3tmUtbY7NbJaJ6p
 DlHRQBVJc+sG0b2sx0VFI0WzQYsP7fEbZ7sPSyCUgAP1R/U1AyMHQF7VSjl5gKXjal5hY9BYB
 hgYUz4yh/XM0iqV2Od31/iWpfGJ9ejrs+T1BlCg88vrSpqWr1K5xHJDFiJQWv7ROmDxYr5Psx
 Hrp1pQD+iutQQS30la5TW9JHhZDVYfinkSwguGCfezGbW/UNpcE2F2a1pSZwu0VwXMN3dqpzL
 C72YktyGRIweVLhgo0/twcoVKRwOAypFifXnV9lSJgXrvDxETKmROROFXKveZ87KPl/sZjLnU
 xl5gNarsWzDv5UyEgGbvlsCifFDgyJNMERFuUdBuJfDhdM7jRRgVOWjuvtBiEiYzeqwQEiLui
 KIbTmVfsrQS4kbJEfI44elLOXjJga5RxRMQwZ39g3ISyOx8oqTA8keRlYD4UTX62tl16tm+oz
 DtvyNxly0risArxhQcFMMUk28PW3CZhxTTUY3gbYEFDUzvzDw+GNnUwJ+aL4JGCt600O5aIqo
 ZA3LvFFxDkoh2/+El5UtRExWGPAkc8+j1l3GxEOxFILEUipKFqYCyUBCizy9/u9VrgV6D8om4
 lfEjHLWMxoOGG+WnljREF76G5yVO9eCTtdvyxoR/zPUOCOKuhzFQVr7NZrDbYcLEq4blhZQM7
 hYrTOEcMZXwNwJKgsBLq6qlvwxG1rgtZCPTztDGaz8MZ2eCTKZ8fF+Jom9pQPgTUNu8qhutlo
 0/HTjVhREU92pfvk+sfJPBLbH1bIe+fEvc1m89fAtsdqyBJ+k2ENY7/YKRPhYDaVbAbatf8+0
 4gLFn8L8sMufJcpJqsA/g5IKWG78pWrUxIBgOKgmla4nahUkaB3v2klkfaY7cpKaSgh9HUEt1
 nHMhTs0LdJLBKSiwsRfh7FgnTqxRfJHCVC3hKHmtHncpUh4D4/TEoYEpT3nI1a4LBb/wDyFNI
 7CJzVT41LiaKmoxOnFJchZSj/xJmlqHR/jD
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 28 Jun 2019 16:17:08 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 28 Jun 2019 16:16:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [Cocci] [v2] coccinelle: semantic code search for missing
	of_node_put
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

Pj4gK3ggPQo+PiArKG9mX+KApgo+PiArfG9mX+KApgo+PiArKUBwMSguLi4pOwo+Cj4gRGlkIHlv
dSBhY3R1YWxseSB0ZXN0IHRoaXM/ICBJIGRvdWJ0IHRoYXQgYSBwb3NpdGlvbiBtZXRhdmFyaWFi
bGUgY2FuIGJlCj4gcHV0IG9uIGEgKSBvZiBhIGRpc2p1bmN0aW9uLgoKV291bGQgeW91IGV2ZXIg
bGlrZSB0byBzdXBwb3J0IHRoaXMgcG9zc2liaWxpdHk/CgoKPj4gK3xyZXR1cm4KPj4gKyh4Cj4+
ICt8b2ZfZndub2RlX2hhbmRsZSh4KQo+PiArKTsKPgo+IFRoZSBvcmlnaW5hbCBjb2RlIGlzIG11
Y2ggbW9yZSByZWFkYWJsZS4KCldlIGhhdmUgZ290IGRpZmZlcmVudCB2aWV3cyBhcm91bmQgc3Vj
aCBzcGVjaWZpY2F0aW9uIHZhcmlhbnRzLgoKCj4gVGhlIGludGVybmFsIHJlcHJlc2VudGF0aW9u
IHdpbGwgYmUgdGhlIHNhbWUuCgpJIGltYWdpbmUgdGhhdCB0aGUgQ29jY2luZWxsZSBzb2Z0d2Fy
ZSBtaWdodCBldm9sdmUgaW50byBhZGRpdGlvbmFsIGRpcmVjdGlvbnMuCgoKUmVnYXJkcywKTWFy
a3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2Np
IG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYu
ZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
