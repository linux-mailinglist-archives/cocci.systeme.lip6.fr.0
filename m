Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B2A010A
	for <lists+cocci@lfdr.de>; Wed, 28 Aug 2019 13:51:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7SBoYl5025521;
	Wed, 28 Aug 2019 13:50:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A7D5177A1;
	Wed, 28 Aug 2019 13:50:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B07B374B3
 for <cocci@systeme.lip6.fr>; Wed, 28 Aug 2019 13:50:32 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7SBoU5C027802;
 Wed, 28 Aug 2019 13:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566993029;
 bh=sVcAEISU6Is1Tq9hfCaIW1wJUO3eYJmj5WyXjzNQXk0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=EcTK2CLwuLaIrLfpbKEeZxK1SvKS4TECW26sylVo/cQkPkgsozI5inbiB8ElZttdc
 Y/PrRdy4mEdOQ8W00M/RMJGWaeIeLcNsKPVh0Ke00YLa2hEkYDy8G/JA6RWdPFwNU6
 rx0mqp5IOraiKueW82vxUCea0wC9ikbWl1AkjUFc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.113.2]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LfiZ8-1iZV0x1Fxy-00pLlk; Wed, 28
 Aug 2019 13:50:29 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <a7f12c28-0f96-d388-f1f4-57db4d3d880d@web.de>
 <2AE15A09-F219-43DC-81A9-73C13CFC0753@lip6.fr>
 <661aa3dc-3514-3d75-eb3a-9e46843fd02d@web.de>
 <alpine.DEB.2.21.1908251547420.2283@hadrien>
 <c6f15b8d-561e-fda4-1531-191334f1142c@web.de>
 <alpine.DEB.2.21.1908251741460.2366@hadrien>
 <17be79c5-00b6-33b0-730b-6b4b1d21f03b@web.de>
 <alpine.DEB.2.21.1908270856160.2537@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9643f2db-a6c0-c572-06bc-bf5e09fc7e76@web.de>
Date: Wed, 28 Aug 2019 13:50:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908270856160.2537@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:9gCgJTU32ZlKFCWi1C2QvcRDq7hSGXmR4rjadQMDBDN+xXtRaDE
 cr7IPCvWmnxQPH6dtDXdC79PZPv2ujFT3F0QMKiPRmAAx0NG9prxFeN+jOIJuSV6Ui9hVFg
 piGnkW7+wewLJKrodB7oCQZMHXXH6nqzqFy/DIacMleDMCvPvmTa6IHybRbbhOP7CLi0DKk
 1k/2cMZSqd/l7zvd5nsnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b9TYY3LeSFI=:An98oBUNkSeMe/pT89LTUE
 L9n001ytR9mTGfJoF6A5c5nE0QZNOOsjdwY59L9kNDd8AGTKNFUStX1nL4aY8mCGAI0LBbsvP
 VIUyemf1MkcF09skG11uZLIgGStIZNQEhY3ne+pFMCMdei1IP04lay/qTvHhkI/yaw3vRTB2B
 Sj2AeAlELf4fwtSa6pf63acPzvYmIeB4sHKbmwD6wwLe/YFzFpzEU1BCTlUzJFA6LAmqdPw2I
 sVKswxtiMlsD1Jb60LlXkbYFV0gNiMEnmNWyRojZjRUn4CWCffY7iWLrNQVm86adGM+UWRaQZ
 iXyqeElmBy+2zICehn030axjKEgnKJW7KPG3aqwaseTI9r8lzevvAGQ/CJ3YOqD83UYWi8WS3
 RFpC2L8pG4IxS7D+LtLYQ3s3D5JwNcLhIngyYBEMNYtNtW5X869F2QjcbJnmhh36efp/CQXeR
 rSQZSZYlBdjBtCmpdjHcDkiAL4gzb/+52HuKJzrFrnukK3YBjYJqXhgv++XW92BQtUCdMN/QD
 qYnHiqHtLMOo00U6yO+aT6P5cF6W3T9O4Gsz/pLN+vuLff7TTgdoe2fQImaXkKSjq8oihi4FC
 s5M+7RnkA2a0GpanpPUuzzo3iZQTKV2TvE20x0jFnrwbODp46ER27hGn6eQdfesGsFGXqYvVt
 50SFtEgwa3MyrvvQk+N7B/z783MZj033RFiygXA6WyWVE4QMVntuP62CzQzaQ/z4W6bRpQeZA
 bIES9VQkTBfNbnByPSyca0FF5OomXfcZmQMvgp45Ee4UQAtrxecdPD5lO7YSnVQbZrxyrBkqm
 Q/s49tb7ZxWUGDWSzUCfdSKx+TxXi1lmC1BiZnSOpHRD6vd1NRTok/qseLD6e4Z2Dq+w3igxl
 gyoNRRwksnSxwC84qVp26tCgbClICdZ0RaCsUzmAibn46EbO1qHQpIaWjwPrQa2XDXlK1U7Cv
 xPRA21znTw1U6sj4QBPNreFHLLPsbrcMnqyQaKg95HXwCC0nspfm1fwir0aRGHslEc3PZ63Wk
 8aIOzt9hk0d/Ivarxxkx5IolATNpj4N5HPuUD+m29gaOQckPTnNnF04a0VICyK1S2t8GQ1qpp
 pDVjA0wslgDlAZtRmiOQx10X5XoFm15MYEfUafGz6HbbYfMMzf3c2aeocvrSuvPzWcde/r1dR
 MwhyU7d0gK3SYlDs2RQb/Se1ErxEC62TE77k78PO6BUIGMsQ==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 28 Aug 2019 13:50:36 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 28 Aug 2019 13:50:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking null pointer handling with SmPL
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

PiBTVENoZWNrIGRvZXMgaW50ZXJwcm9jZWR1cmFsIGFuYWx5c2lzLCBhbmQgaGFzIHNvbWUgZmVh
dHVyZXMgZm9yIHBhdGggc2Vuc2l0aXZpdHkuCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFk
ZCBhbnkgcmVsYXRlZCBpbmZvcm1hdGlvbiBmb3Igc3VjaCB0ZWNobm9sb2d5PwoKCj4gIEkgaGF2
ZW4ndCBsb29rZWQgYXQgdGhlc2Ugc3BlY2lmaWMgcmVwb3J0cyBpbiBkZXRhaWwKPiDigKYsIGJ1
dCBpbiBnZW5lcmFsLCB0aGUga2luZHMgb2YgYnVncyBmb3VuZCBieSBTVENoZWNrIG1heSBiZSBk
aWZmaWN1bHQKCldvdWxkIHlvdSBsaWtlIHRvIGFkanVzdCByZW1haW5pbmcgZGlmZmljdWx0aWVz
PwoKCj4gb3IgaW5jb252ZW5pZW50IHRvIGZpbmQgd2l0aCBDb2NjaW5lbGxlLgoKQ2FuIGluY29u
dmVuaWVuY2VzIGJlIHJlZHVjZWQgYW55IGZ1cnRoZXIgZm9yIGRpc2N1c3NlZCBzb2Z0d2FyZSBh
bmFseXNpcyBhcHByb2FjaGVzPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0
ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2Nj
aQo=
