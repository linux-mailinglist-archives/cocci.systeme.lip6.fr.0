Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0028CA442
	for <lists+cocci@lfdr.de>; Thu,  3 Oct 2019 18:33:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x93GV1J7023804;
	Thu, 3 Oct 2019 18:31:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6A63877BE;
	Thu,  3 Oct 2019 18:31:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4E12277A9
 for <cocci@systeme.lip6.fr>; Thu,  3 Oct 2019 18:31:00 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x93GUxY8024820;
 Thu, 3 Oct 2019 18:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1570120240;
 bh=tb+bIDGQBs+ntTnSgfe0s9MwVA9SDsOiJM4Tsjn0pPg=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=I2Bz8yw+bcYsr2MrVHtp1Gn3X2f3w6992XseqcUqBKj1XyHEe+MGvkKVgaAQeE/pF
 nLxIt87ATFNxZgMBs14LsC/xYL9LvRfUprRFN+ZuDF0/AZhq4ioWle+L2yuAgJw57F
 Bh9fWsFZS++YHY/gpq/BWumwxMuxRUiEfdvv3W1E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.81.27]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M40zO-1hy7TR3OpW-00razP; Thu, 03
 Oct 2019 18:30:39 +0200
References: <CAK7LNATAqM9QHRqotFQsmh64rww_AxNm4gdV2t5TuYxHA++zSg@mail.gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0765d504-cc91-baea-ae3d-ec4c0a2c194c@web.de>
Date: Thu, 3 Oct 2019 18:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNATAqM9QHRqotFQsmh64rww_AxNm4gdV2t5TuYxHA++zSg@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:F+JSg/0mwKCAcWtRTNJc2ejjAS/1qD7UsMGj1o3osY0iza+S8a6
 cc1pTlF7bCaF2dBac/nvPgJF/+Myuo4xu+ZbNN2BIfTVTrwOEbEkRQkbH2uZabj3c2e75RY
 PObmsRP8U6gau3LKyHmPGN2+8Xnp+Jdzc/rMxhtViPQqWrXnZlVpig+qg8g5AhP7gDqPH+3
 QcqGrbYmPpWj0u5vhRFRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e+afk+NT2GQ=:SbY7XsYtOCe10YoRpQH3Hv
 0IxBVlyx1+IymGVO8r9Ws8uTh1WOF7I43f8Ptjpcogk9fDOue/u7aqEa+668Qc3i9k7Q+1/b+
 37xC6NLksQzMcEDTD5iDjOR7elwAj/hioxr1CL4Y4ETOXIwoC3g0QlTzWhe0bZfVyTQckjJJT
 CKijSUqLq6Od0fPnCMag2mrefWWhcJoEwmcVTLIA9MIb2kuvO00c/jdPs59lepwBIa31M5ZJ1
 w87snanqMiiO5Ym3rf86GpX6TR+IsqJET55VYChoPBLGM9/p8pj4+c3GY05HtAIFTO6nZVOEF
 UXt7i9PSOtFeqhL/MXeV2hu2D2TeE8Y/AYYZF5RwrWKZn88xooOqWIC0G/YoJ9qeeyjNh8m1v
 ENGmUTmrmpNcQfnD/6zTeB1fEk4wJKoCzpo+CtO0V5/c7NFFPP6VwGnW5V3RMUUrL6mHokGsi
 2lbefx2FhvpoX9hAjUgsD0sV1nFX13KDs5YzNIKFybqzufj8OAYJba+NU1JEFntSbR5AcpwL+
 Rm4yPZwyDhUOddcUwvAOVWTGloXosoJab5rmqHula38gFEq8hwXDVuSo7ViJmq9t+21NEsrHR
 /bXQeBMeC5LPKgadupnya/pbGSm0KSOuZvUoRo6l0feHzKALVKf9suC8jfNa3jy423MxnDDMz
 SkvZ57OnL2kRdX/imB5w9yryTjdKnQ989Qr7VwXjDwQmTgsgbiYfTvGzkfLbIl/xsd9qeiOj/
 byM4ZK31hEBk+aefUFB2SbCgU100Qj8uEoGMDjb4rU7DP2zfKa+T9Td8/yZitae/KfRO4C0O3
 Lmj2ulVRkXTdZAr0Pj50pu9msqcjdk4xC9moryGQCkEIULporjGvvdLXqwyFgTFD11mUKiwNI
 hYeOyjoyUpdMkKv5PTaLot9GtZpIuLFbjx9CTPYByF+cAthJlnysSMkjh+3KRKBybQK6NI7ZS
 emWgLaFmOcZmrzYaoyYEed14RWsCU9ubwHXUHjpumtfvYCrYFMpzw8ogZ6IrjmQARI7RTPMZw
 bcnO/LVMZGXuVrijfhb9AzwVEV/X8Ya9pFeTMP+B25AbVDH2AtaNQY/6/UZA2JcJ2A+nnSrFO
 ZsyRJyYRUKJ7+HegZqshNjdzgHNSMigdgaO7RMB5xfH4N8VLINsSYPrbavMW+X1mM+wp2WjoN
 SI1Vslnp6kbF95ZaoKNDhMF8I3OPL3JBHu77hNpjqLnbVor6A5GcsoNnSB/Fiw+mLRZnq4CK9
 /rjiT2Gz2k9ky6SJw0f0pQ62g1W2K3AXoMnat8AnO0JQCZqF2tlVAoTihyns=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 03 Oct 2019 18:31:01 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 03 Oct 2019 18:30:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>,
        =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
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

PiBXYXMgdGhpcyBwYXRjaCBwb3N0ZWQgc29tZXdoZXJlPwoKWWVzLCBvZiBjb3Vyc2UuCgpZdWVI
YWliaW5nJ3MgdXBkYXRlIHN1Z2dlc3Rpb25zIGFyZSBhdmFpbGFibGUgYWxzbyBieSB0aGUgdXN1
YWwKbWFpbGluZyBsaXN0IGFyY2hpdmUgaW50ZXJmYWNlcy4KSG93IGRvIHlvdSB0aGluayBhYm91
dCB0byBhdm9pZCB0aGUgYWRkaXRpb24gb2YgdGhlIFNtUEwgdmFyaWFibGUK4oCcdmlydHVhbCBy
ZXBvcnTigJ0gdG8gdGhlIHNjcmlwdCDigJxhZGRfbmFtZXNwYWNlLmNvY2Np4oCdIGlmIHlvdSB3
b3VsZCBkYXJlCnRvIGludGVncmF0ZSBteSBjaGFuZ2UgcHJvcG9zYWwgZm9yIGFuIGFkanVzdGVk
IGRpcmVjdG9yeSBoaWVyYXJjaHk/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5
c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2Nv
Y2NpCg==
