Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626066B6F
	for <lists+cocci@lfdr.de>; Fri, 12 Jul 2019 13:13:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6CBDPwe010184;
	Fri, 12 Jul 2019 13:13:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4DAE17789;
	Fri, 12 Jul 2019 13:13:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7D92B7772
 for <cocci@systeme.lip6.fr>; Fri, 12 Jul 2019 13:13:23 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6CBDLjd004174
 for <cocci@systeme.lip6.fr>; Fri, 12 Jul 2019 13:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562929995;
 bh=TmlgZtsuf7WQBRhBPXgSSO0Kly1lGCWgOGMAQMMrOUM=;
 h=X-UI-Sender-Class:References:Subject:Cc:To:From:Date:In-Reply-To;
 b=ElO1WD9n+fPgKPxdTckvisVhn5Z4zf64h4dQdmsrV1q0B19O8aMZDR0cGHkjXA2JX
 sYr23YOpbN/kmSs7K81X78OpOPqDpULoZe73wU8BSMGggjwkii2Gjqdd2pBTJdMdDd
 +kpfTB4FGFYPiLpHmLXEt93VLnBP5ZIJwX6/1hKo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.134.246]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrs70-1iTMyD38zW-013age; Fri, 12
 Jul 2019 13:13:15 +0200
References: <20190711152116.GA15492@redhat.com>
To: "Richard W. M. Jones" <rjones@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1820e3f2-cb4a-5e1d-44d8-acfd642893af@web.de>
Date: Fri, 12 Jul 2019 13:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190711152116.GA15492@redhat.com>
Content-Language: en-US
X-Provags-ID: V03:K1:jnaeF0BmOb+TiL+YD5GSAMtfspyLDWZ/hacIZyUxNa1tFl/xpT+
 Gbv8lsfxcDh75fhXOm4DaekqKV8pS6XdGEmNN9k4Y1kV1hPOc78IfieX823RufwQ5viWT01
 N2irACXbpGibMu118u5oZtIWzS5ylCTi+UooBbuiSlcluG/9hwsDsth4sdV3Y2GtCAiYfCk
 dYX2XWnxVjzdpbJklvbsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0KWucPQA/bQ=:R72ndMXcTMXY/KZPkiBiAu
 X328MT7681ions1OxYMJsOVSWMji3hXX4WD1AdPFR8qu/gCVBrzONwvc5q6s/nfZcvoweQgxY
 A0pzBQU/ZaFhSrCo/P4UYLyu95Ua2q8RyxnV1VAJAHnE+gCBrj/BNUv4jnqOSMSK8xMIrZfj0
 TSAVQNVgmXxFxx04/jQFBl7zeVqxt65UfpF+Eggrl5GdJbrEAtXrvs72+fxkbIYsurCp2rJM8
 Sc2FRr0zH69YecT+2kKURZM6iiMUqskxU+OJZX7ZNYiuKnY/A7M2aH9hPiegkuMdBo+2NOcxg
 WHrZ8MrqysWUPIBKck69FmZ2WUBI1X44ac3OjiLcnC0JUHGhUCp8ZQYVLT4srINCDoUbR2gid
 gTP/YdVSEIJQE5tuh3DkClywulMkYIL8TF+tVUiAC1QjHNfiJ9Gx0Z/o0weN4CRO7jgYh/LkT
 S3lpFyLEFtObx+W/V95EQAB4LEaw2rpOWPljvhRoj+178qapslzngeiDpKKo2U5h2gKVW+/UX
 R+9JcU6wIbucksZUFE54+gYq5iPsqxFbMkCjLcUbYkVdjp7wCF/a9lLXTJiF80/wt8o/1oDZz
 vtOry1O9zEP7rxPUiX78lTGJr1r+jfWICARiyj6BVi1LENWvhF3Ml+vNww0WIjsvAsuv6zHDi
 K7Uz/qwTqyldezbmtF8TYh6rehw9dNGwDFKKMkycYgDNGFw+fGn8irxukC+to2p7/C3pRSYjv
 Yrn+vV2/YYSFDQItYKZ3n9LcVy3DAFXH23eDOeSJRr3HrgSStUgjdUyMCs/r/R14CZtHZn4Ze
 chbwR03ZIgF82Tf56KaXMriqM7/KhhF0uLblDyOMooR5NLma89wyIgVfVL5r8ZwRBl4l+mfZF
 XvhGrpknjsd4ABNst6j99tcFifpoaAFVqXxq2d1niblcjzV8JNGUYHnSKyXyzm9I/ossgxH5h
 hl9N8fcRv2Sw01ScE2P/AflVJ6VchIdSTUIm5+VrxEMiAxMXuiqjy0UokXVRc9FJqPGG/YIba
 nx+NOxamNkj/Wjatn3K7cpl1PR5gN12A2YmfXFhQoqvCtjZzJ6mva+dgrHVydvXbGVP7QuL11
 FUC4pTV7mHgGv62rgA5fpHNE3S/Al/m//rT
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 12 Jul 2019 13:13:27 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 12 Jul 2019 13:13:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Compiling with OCaml 4.08
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

PiBIYXMgYW55b25lIGF0dGVtcHRlZCB0byBwb3J0IGNvY2NpbmVsbGUgdG8gT0NhbWwgNC4wOD8K
CkkgYW0gdW5zdXJlIGFsc28gYWJvdXQgdGhpcyBkZXRhaWwuCgoKPiBJdCBzZWVtcwogdG8gcmVx
dWlyZSBtdWx0aXBsZSBjb21wbGV4IGNoYW5nZXMuCgpJIGFtIHdhaXRpbmcgb24gY29ycmVzcG9u
ZGluZyBzb2Z0d2FyZSBpbXByb3ZlbWVudHMgYWNjb3JkaW5nIHRvIGEgcmVwb3J0Cmxpa2Ug4oCc
Q2hlY2tpbmcgZGVwZW5kZW5jaWVzIGZvciBjdXJyZW50IE9DYW1sIGNvbXBpbGVyIHZlcnNpb27i
gJ0uCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL3BpcGVybWFpbC9jb2NjaS8yMDE5LUp1bmUvMDA2
MDI5Lmh0bWwKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvY29jY2kvNWU2NmFiOGMtMjIzMi1jYTg3
LWI1YmYtYzkzYjNjMWExNDA2QHdlYi5kZS8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29j
Y2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGlu
Zm8vY29jY2kK
