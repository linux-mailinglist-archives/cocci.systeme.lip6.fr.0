Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 800F3F9502
	for <lists+cocci@lfdr.de>; Tue, 12 Nov 2019 17:01:44 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xACG18mt017504;
	Tue, 12 Nov 2019 17:01:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CA9F377D4;
	Tue, 12 Nov 2019 17:01:08 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7B77E77C2
 for <cocci@systeme.lip6.fr>; Tue, 12 Nov 2019 17:01:07 +0100 (CET)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xACG16B9027143;
 Tue, 12 Nov 2019 17:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1573574466;
 bh=wXelk5FfWlakeJvAASHB6TTwxOFDF62yKRycOoCLm+k=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=o3vM2eHh0WGb0vpQqnLI2BlOH0WIhzsfQNHC0+1TR50B7eqfwciswQwxyiK1HuIYu
 YlCbYGUWNXgo+CQsBGnkGXp1ZnsSBaXAOJmjp7bg1Q8MmpFG840k/gICkIttiXXZPp
 ltUFJJ638bbSZBwIzqxGu6p+FJ0thxngitSUQWlU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.102.255]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LoYX0-1hwrU33BEY-00gUEq; Tue, 12
 Nov 2019 17:01:05 +0100
To: Julia Lawall <julia.lawall@lip6.fr>
References: <c86eccbc-a1f3-50fa-34bf-f8fefdd3036f@web.de>
 <0488a253-fa97-cc18-7884-a7509016d8fe@web.de>
 <alpine.DEB.2.21.1911120522520.2536@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <57f95f35-532a-a9ea-62a1-cbd8d53e1a86@web.de>
Date: Tue, 12 Nov 2019 17:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911120522520.2536@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:R2g3s/NExOTT+M+RxXiHUxmIAehuCINt9qoC4/RstKAfm04N79G
 DZeXYUWD/cYmv9sxEdK4Qr7TdsjDnhz16bjO8Zms4D1EwZVmWHyc7Cx0ldJdkAE+judldng
 ubwmFXdOFoEvvOJ7RQHPztxzVkECdyk7TYMRLKS+2qW1cr7V2fBEql/J5aWXSSxmjpRIR6F
 SPqdkZ7bII/2M3/P160Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7GMNKA4O50w=:xYmlOBA4PYg8u3r6WSt2Cs
 JcUDEvwaZUqlYcaPtafS2CXCcPaqxV7J3Ac6r9swzsA5Ldsqk78glb+6dJsre7xdlFFTHrg9e
 qyqPWLloOtj/Hcq41+D4Rn29SDlNNNAqW8qDR0FNFdpX93e0MTf48WSLUXJvwK032VfaZ99uG
 BxLqQ+PuCJmP8TN9YyxcO3DNauhB5UjSldjwW/gltZbKNfwxQRNdr1OGUR9ivEZnWnTxAHdTG
 v/xvikh0e534YkKBX51AJJjsCEcUmQSoTJap4THGVlsYZSG1bLoFQirY2RBKGNqocATpKJ0RF
 N+oqpHnBSLy3ROz5meQummPfi4e+gjEaDoISSuWUK+X2M3gIey+eR+p5O2AX8sddFQynkUNAv
 kSQLE4BULoQp+LCsbhh0srEqNko6f1bYpYHQn2PTbdxN6fTp8MRXOPPpzUGM/Dt6TXYaShsfl
 WpZWho0mnjar3XJdVHt990+GsG+ZDBc23ocvn4P2klN6jaN+4FNA7IvVzu2JPWLmOd/j6xkdK
 NpU8pOiUfMnadumugd9CVeJVR4iu6swTIqzgV2scFdTgsieI18TW/KFyabfU3stsLdZAyQw5J
 rbNcLNKm9vQz3PrwX/2woZ5cesOeu17IbGFxJIzRaql1UyfGaTFQlPD72djgaZ0xW+QG1RY9J
 vNxPwGhjrR8rekF+N/LpN4MEpWiN9H5kT86HNJqkSBq/M0TxltU1ymfTSU4X3Wkoal9xc2IhA
 cB8B+VlfGxuBfwjhsHYccgPQ7aHeOc6oqonGjNRcMQ9Z1OQfRFpIyP1DRLihomy4AytrdJUn8
 hyZMCycYCkoBEPah6ZzkFSE55UPmyjedRdWH9+8P8Sqr5iMHutQyshPPmE2hlkWKaH91uVYHI
 hBbHHzlvoA1hP8XKO4UANkwYQBhN6JqI1R4kLtbalPZRgzkuDD89lxU/raZWQpc2pyY9BL8Gw
 vdSNfJf0EKudU1NtQVVBrkTFT3EtD/2SXXEZVBntPqJY9AryYdS8PLRDVhOBw7byKNYn4Cr1y
 e9HI2Dl7HjB1ZZVETGNBM2DQg3rP46gbXj33tp1oaJXShfXn7/HVAZRVWXORjOqeFTzywzuWF
 VS/DS1L7oJhEg6ptEJZgI/iMfdBOh1BhGAWasguwOowqwy4FG9eBzrBVz+zG0FCYC7OD2zPuC
 d5iBNEs7q4tnYqwqSk2cpYKNduU4SIWnyErIBqLptuTKvJZfUfxici2Nao6HY8nCuSWsEuutm
 TlGheyZmYZiOo8ZLtQ6GLr4DnEYvxb4COx4kHycSEkK+6DJxYLihbTX3xmY8=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Nov 2019 17:01:12 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 12 Nov 2019 17:01:07 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking data processing for parentheses in SmPL scripts
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

PiBXaGF0IGlzIHRoZSBxdWVzdGlvbiwgZXhhY3RseT8KCkkgYmVjYW1lIGN1cmlvdXMgdG8gY2xh
cmlmeSBjb25zZXF1ZW5jZXMgYXJvdW5kIHRoZSBlcnJvciBtZXNzYWdlCuKAnHVuZXhwZWN0ZWQg
Y2xvc2UgcGFyZW50aGVzaXMgaW4gbGluZSA24oCdIGZvciB0aGUgb3RoZXIgU21QTCBjb2RlIHZh
cmlhbnQKZnJvbSB5ZXN0ZXJkYXkuCklzIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlIGxvb2tpbmcg
Zm9yIHBhaXJzIG9mIHBhcmVudGhlc2VzPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2Nj
aUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5m
by9jb2NjaQo=
