Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E11A3708
	for <lists+cocci@lfdr.de>; Thu,  9 Apr 2020 17:26:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 039FQFLX011291;
	Thu, 9 Apr 2020 17:26:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A917A782A;
	Thu,  9 Apr 2020 17:26:15 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B412F7815
 for <cocci@systeme.lip6.fr>; Thu,  9 Apr 2020 17:26:13 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 039FQBTq019539
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 9 Apr 2020 17:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586445952;
 bh=ZonEYqNVCp/TltkzjuQu2rPyqQJQCI9tKR9g+o2Q6Sw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ItsGFzuFvjrdNlVuyemikoI9m9LxFsQdqu0DNmlxDw4gegfjF7ajjgo/i/Bt4rmB3
 YyA5njI6o1kEQshnG/8A+MyOdvrbaGststDI5HAHFYT5w9JgplREWe5ESAV3ggyJfE
 xkoxrYLhAjwm+3msx/YBuAgZt5u9OULDQB9pDiJI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.77.56]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lj2Cs-1ijdgE1Ht0-00dClz; Thu, 09
 Apr 2020 17:25:52 +0200
To: Alex Dewar <alex.dewar@gmx.co.uk>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
References: <beeed2c8-1b5a-66a8-ec41-f5770c04bae9@web.de>
 <20200407160330.5m75sfkhrrx3wgrl@lenovo-laptop>
 <045a4a1a-c841-2979-c899-b632ca418b3b@web.de>
 <20200409114450.io57vlnrzotsemqp@medion>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6f0fee23-2de9-d322-0e11-2a117e56cdf4@web.de>
Date: Thu, 9 Apr 2020 17:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409114450.io57vlnrzotsemqp@medion>
Content-Language: en-US
X-Provags-ID: V03:K1:4YZl1s9MQ8LjfaMP3TmYW+ADhyqVpeg2X8UTAwn/bQAa9fn6tMK
 F3EYD7rZ3LXgLkrxYuKW0XgsfNvVoNcp0myieKO7wA2zLwiKIoLwMz+uI3+x3ctcVr6jL0G
 lpUQg27gmfsgPKv0euTPalxOHtBMiLEs5G7CSf8FYBEXU85N6khSFkWR8LkWqPI317t9Qs7
 nFNQCL+3S7Xh50PJrbtkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qK0u923I5+s=:mT9PEf1JwPM7/B3hadlzDH
 S3egAhrCpqfnW2MaH5pu40nu+EfU3ak6WRoKvHc3QwWXxp1S64UR7A2/qb7ejiATUBNS1UM82
 dobqNs8gDnEpyXlu5nuMkY+H1unaqCI9FVNROP+qQ9tWT+BMMk4Q2b+tf11Ku3y5cPYVxibvl
 zxJ4hAVWblw6OiXIUCFQ1MvILfqZlErQerCvmmq/EGvmtqh1RULtRyWxghfT7CAoGo5MnFe2B
 YscB64LFF02YmL0G/eZFPOXKAJdjQekzGgQKVS/Jid+nB1toBD+WUoHDJRZCZ2B0GUXpAvd9G
 NlL5b7EI8qlS7q7U/N7rokm4Cwm9ldcYGiB3kk2orHcU82lHKNBnN18Y8Apu9v2iihLdgCLv7
 oRDJSOCvAJI0ehN175XuWISySqouci7QiAVeylfR4Xmd1yItxGjuCOAV5YQe0V0Lx8S6V0yBv
 1XpkoLh2NIEK/ZaH+eTGs5vPfNeCnL4SciL8J2GakEwuw/e/cVHN4TzmYa7n8IxYOwOsBROVY
 h+HGDi8Tqp+sBFcq4ZoirDsErcAFXu2pbBkw+IzYl8Bfxb3l+8NYf5xeAzOF7Sv/lQOr9thJD
 euP0DKwP11ZCzSR8jqAqahVylpAZZ248sR3dm37cHO2hur6LM1fXQKgHBZ50AS4roCkQuFnBq
 hg6GAGHhkJcqePkqtvNftN3X1d+Rb9FQmtbDmnxnUrrFExSchap86pVTJM2MKe1lgTH+Si6Xg
 nE0vy1l2HW81zADr9s1a2WJsisXywyqzldhIGxLDcU6cRMxKybmDOtrmQAv+liUpmW/i6SDaT
 TshAzVu26G3ClElBk3QrI986cBEObckMkbyO6/zAghgHcpeTGZ1FvjmmgegXFSNTgby90Ec/b
 wM8h8FjP8kD3EJq/7xw4BYEtXVYuSKzI8CZMiKg63TV9NTCdF7OwVHxCM+k9W3CwKe9ZelP4Y
 JKsT1YEOBsEEisz+zKNtxxAaqexouMDWjUzmkuPpwttgtPl7X0pPDFhiqqzJdaEgWVMKNcaNh
 QwbctYQkfIOYGC8N/nbUICT4Z1cawYCGj8FO+HRGvv4LgJtBhtb1bClPxwSZqO7pNkOrGzdY8
 SbHuJyJdRYp0jHw9EPn00T3iNgTaTm3sIA8KGuBuwtXYdaIh0fCZpotOTU95b3O2ScOtBIVmo
 pRLeHghUo717IzDaekbzNYyMQL8ELuKeOPXYuiaWOqsP5Wbl9kVKH8QZHghG73NS+IlIqeMYf
 yVNCOc9lCAg6Rd6ll
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 17:26:17 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 17:26:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>,
        Allison Randal <allison@lohutok.net>
Subject: Re: [Cocci] Coccinelle: zalloc-simple: Fix patch mode for
 dma_alloc_coherent()
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

PiBXaGF0IHNob3VsZCBJIGJlIGxvb2tpbmcgZm9yIGluIHRoZSBhcmNoaXZlcz8KCmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC9jb21taXQvc2NyaXB0cy9jb2NjaW5lbGxlL2FwaS9hbGxvYy96YWxsb2Mtc2ltcGxlLmNvY2Np
P2lkPWRmZDMyY2FkMTQ2ZTM2MjQ5NzBlZWU5MzI5ZTk5ZDJjNmVmNzUxYjMKClNldmVyYWwgc29m
dHdhcmUgZGV2ZWxvcG1lbnQgZGlzY3Vzc2lvbnMgbWlnaHQgYmUgaW50ZXJlc3RpbmcKYWxzbyBi
ZWZvcmUgdGhlIGNoYW5nZSDigJxkbWEtbWFwcGluZzogcmVtb3ZlIGRtYV96YWxsb2NfY29oZXJl
bnQoKeKAnS4KCgo+IEkndmUgcmVmZXJlbmNlZCB3aGF0IEkgdGhpbmsgaXMgdGhlIHJlbGV2YW50
IGNvbW1pdCBoZXJlLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0aGUgZXh0ZW5kIHRoZSBzb2Z0
d2FyZSBkZXZlbG9wbWVudCBiYWNrZ3JvdW5kCmFub3RoZXIgYml0PwoKCj4gSSBoYXZlIHJlcGxp
ZWQgdG8gdGhlc2UgbWVzc2FnZXMgbm93LgoKRG8geW91IHJlZmVyIHRvIHlvdXIgcmVzcG9uc2Ug
ZnJvbSAyMDIwLTA0LTA3PwpodHRwczovL3N5c3RlbWUubGlwNi5mci9waXBlcm1haWwvY29jY2kv
MjAyMC1BcHJpbC8wMDcxMDIuaHRtbApodHRwczovL2xvcmUua2VybmVsLm9yZy9jb2NjaS8yMDIw
MDQwNzE1NTAwNS5yZHlpdTd4cXNzNTdyemhxQGxlbm92by1sYXB0b3AvCgoqIFlvdSBwcm9wb3Nl
ZCBhIGNoYW5nZSBmb3IgdGhpcyBTbVBMIHNjcmlwdCB3aGljaCBjb250YWlucyBwcm9ncmFtbWlu
ZyBtaXN0YWtlcy4KCiogV291bGQgeW91IGxpa2UgdG8gYWNoaWV2ZSB0aGUgcmVzdG9yZSBvZiBh
IFNtUEwgY29kZSB2YXJpYW50CiAgZnJvbSBhIHB1Ymxpc2hlZCBwYXRjaCBodW5rIGluc3RlYWQ/
CgoqIFdpbGwgdGhlIHNvZnR3YXJlIGRldmVsb3BtZW50IGF0dGVudGlvbiBncm93IGFsc28gYXJv
dW5kIHRoZSByZWN1cnJpbmcgdG9waWMKICDigJxDb2RlIGR1cGxpY2F0aW9ucyBpbiBTbVBMIGRp
c2p1bmN0aW9uc+KAnT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QKQ29jY2lAc3lzdGVtZS5s
aXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlzdGluZm8vY29jY2kK
