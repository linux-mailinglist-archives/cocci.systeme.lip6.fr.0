Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5C3634F
	for <lists+cocci@lfdr.de>; Wed,  5 Jun 2019 20:25:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55IOK7l017439;
	Wed, 5 Jun 2019 20:24:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D7415776C;
	Wed,  5 Jun 2019 20:24:20 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0A49E7767
 for <cocci@systeme.lip6.fr>; Wed,  5 Jun 2019 20:24:19 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55IOHtw024979;
 Wed, 5 Jun 2019 20:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1559759042;
 bh=yv68gMU0qUwkqkkR9pp87NU4A29XgHezaQlvZv3X2lM=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=HCNZoDiy5UJWmK0FUlWY5mkcrMCxu7wJoKjeNdOjKIZRfqGA4RC9x9BGUMo7cLySm
 wIsJfvD7/e/CInltOOzAz6UBXVk9bYABv1xY06igcegeio68l3i4Dp0IPEgnCrxK0R
 y1QirnCABD7bPW0xaxTc8o9eUtAzM6rq8JFYnHVM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([2.244.21.66]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MgIMg-1hEKfv3PCY-00Nlkf; Wed, 05
 Jun 2019 20:24:01 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>,
        linux-doc@vger.kernel.org
References: <201905171432571474636@zte.com.cn>
 <fa3b24ba-1c57-3115-6a01-ee98fd702087@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1d3370e3-187e-cd4b-93fe-7c011b1eeb96@web.de>
Date: Wed, 5 Jun 2019 20:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fa3b24ba-1c57-3115-6a01-ee98fd702087@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:j9AQxeIIRQDFnw9PHVC7fgQLLMioGBir01544saRIy6/bN/5FO7
 +rdddcL73ZQ+EVl31+9y7yF/5xGvmGidUUWSLAJHeP9NHp5RxNaXV5/XEHXkKiFmYZyj5Y6
 ZOrDwMFvqVgmFyH/gkjI6Hwph36dF/ylnL2IIb9xofiFuuO+Cy0wVnHJSKmbkvFyLqAsW6u
 BZJc98AqKdLf29/2M15PQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ptx137jtm7w=:datVfc+/Jzf+J1m27oxmBt
 wFA1pY/DjVCQgtNeSnGcEXEQMrOHUwNtbF14Qn3qvb5Jqs2BJDJvqCaSEmwmClJayynpZhPOP
 UTKxHOhbNlZA8xHlhtZwKah3nbW/wjEQolUv0QpbJaCjsFxhUgdzsUSAgjfydeVpzxYXg+iLp
 xVKQOcKFUiLESF4tGjqj5Cj6o5OwWW9zUP07p0cNk2AdOXBoT11jLQpjkU3oARyl0tUSvpcq/
 fQXeaWCUpVAKkaI/SNeVkhKdRqwuDVsofgWcyXvi+QW3XPk2gGHNkfehBM4r09wtDouDeX7cS
 DnmkLZ763bFlwI7HZU7qSBvkJXU5Wf8Uo2zhAmfd9gczaGWuGW9rVuaOLMgvf9GEdFdKtudpR
 viW0aM970Lvsl5bUzqVYyAcjH7ZJvyTaDKhEIHbmlS+OH1s7vrtNo99aZ9j3VN86k8FOp2Pmr
 l6eibO0Kr1bcx0eByVqxXwIHFPaXPHCd2Hwq3Lhhdac7gjDJEqNGX4dm3XTKgoT5muxZ6vqG3
 dm7d9xMdfeKsO8ZeWbo8B3+oedSvpt8VwoQpbpAkDvIoJG3U+3EMms8F8bpLLEUYMwboNX3Ur
 kHz9/JncWfz2UPwHFnCK/nE0TYakjxujVpfJSRZbVRw0B1CdR0AMBP90E+2p+I8RglKYKjIas
 e6ul38OcTHy1TxjTkQV/Vm2K5wUTTj0MJxEEUpwbdF8meJIVR75wGQvrX32qMn2G95ZmMOlFR
 2kmA0zwEOrmkHPhVw/ofbIoMQv4FiPnO1qnmgsy8lQ5mEcPylNkRU+cCUG6VQfJQvPNzGoFFK
 +LDd7S029RPR7i0M4+kAZ+t/jI7lueH5WygzAiXYVGm9LSqnhyvNv6X/x4F1m4eSjlpHMcEcO
 osDN0/qSN5n7ERDHWiJlhp9MvxCvfR4AXqucoqoymzSn2lAF4YhMy5JG1FzRW9Qe70i0cJXIV
 wUGUDDgFFZYdRwwTcVgj450Ckm4DPOtgs45+EKyIOhmccw3ZLFgVB
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 05 Jun 2019 20:24:22 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 05 Jun 2019 20:24:18 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci]
 =?utf-8?q?Coccinelle=3A_Searching_for_=E2=80=9Cwhen_done?=
 =?utf-8?q?=E2=80=9D_in_function_comments?=
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

PiBEb2VzIHN1Y2ggYSBzb3VyY2UgY29kZSBhbmFseXNpcyBhcHByb2FjaCBpbmRpY2F0ZSBhbnkg
ZGV0YWlscwo+IHdoaWNoIHNob3VsZCBiZSBpbXByb3ZlZCBmb3IgdGhlIGFmZmVjdGVkIHNvZnR3
YXJlIGRvY3VtZW50YXRpb24/CgpJIGhhdmUgY29uc3RydWN0ZWQgYW5vdGhlciBTbVBMIHNjcmlw
dCB2YXJpYW50LgoKSXQgY2FuIHBvaW50IG91dCB0aGF0IHRoZSB0ZXh0IOKAnCB3aGVuIGRvbmXi
gJ0gb2NjdXJzIGluIGNvbW1lbnQgbGluZXMgYmVmb3JlCjQ4IGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9ucyB3aGljaCBhcmUgcHJvdmlkZWQgYnkgMjAgc291cmNlIGZpbGVzIG9mCnRoZSBzb2Z0d2Fy
ZSDigJxMaW51eCBuZXh0LTIwMTkwNjA14oCdLgpXaWxsIHRoaXMgc291cmNlIGNvZGUgYW5hbHlz
aXMgcmVzdWx0IHRyaWdnZXIgZnVydGhlciBkZXZlbG9wbWVudCBlZmZvcnRzCmFyb3VuZCBkZXRl
Y3Rpb24gb2YgdW5pcXVlIHdvcmRpbmdzIGluIHRoZXNlIGRlc2NyaXB0aW9ucz8KClJlZ2FyZHMs
Ck1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpD
b2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5s
aXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
