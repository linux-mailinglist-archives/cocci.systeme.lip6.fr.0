Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B700136D76
	for <lists+cocci@lfdr.de>; Fri, 10 Jan 2020 14:11:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00ADBP3q013448;
	Fri, 10 Jan 2020 14:11:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5971F77ED;
	Fri, 10 Jan 2020 14:11:25 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 666A777E3
 for <cocci@systeme.lip6.fr>; Fri, 10 Jan 2020 14:11:22 +0100 (CET)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00ADBGZZ002757
 for <cocci@systeme.lip6.fr>; Fri, 10 Jan 2020 14:11:21 +0100 (CET)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422; MF=wenyang@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0TnKMqhn_1578661869; 
Received: from IT-C02W23QPG8WN.local(mailfrom:wenyang@linux.alibaba.com
 fp:SMTPD_---0TnKMqhn_1578661869) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 10 Jan 2020 21:11:11 +0800
To: Julia Lawall <julia.lawall@inria.fr>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <alpine.DEB.2.21.2001071823060.3004@hadrien>
From: Wen Yang <wenyang@linux.alibaba.com>
Message-ID: <a6d58a19-c49d-f72e-9576-3ca64ffd6320@linux.alibaba.com>
Date: Fri, 10 Jan 2020 21:11:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2001071823060.3004@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 10 Jan 2020 14:11:25 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 10 Jan 2020 14:11:21 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] coccinelle: semantic patch to check for
 inappropriate do_div() calls
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

CgpPbiAyMDIwLzEvOCAxOjI1IOS4iuWNiCwgSnVsaWEgTGF3YWxsIHdyb3RlOgo+PiArQGRlcGVu
ZHMgb24gY29udGV4dEAKPj4gK2V4cHJlc3Npb24gZjsKPj4gK2xvbmcgbDsKPj4gK3Vuc2lnbmVk
IGxvbmcgdWw7Cj4+ICt1NjQgdWw2NDsKPj4gK3M2NCBzbDY0Owo+PiArCj4+ICtAQAo+PiArKAo+
PiArKiBkb19kaXYoZiwgbCk7Cj4+ICt8Cj4+ICsqIGRvX2RpdihmLCB1bCk7Cj4+ICt8Cj4+ICsq
IGRvX2RpdihmLCB1bDY0KTsKPj4gK3wKPj4gKyogZG9fZGl2KGYsIHNsNjQpOwo+PiArKQo+IAo+
IFRoaXMgcGFydCBpcyBub3QgcmVhbGx5IGlkZWFsLiAgRm9yIHRoZSByZXBvcnRzLCB5b3UgZmls
dGVyIGZvciB0aGUKPiBjb25zdGFudHMsIGJ1dCBoZXJlIHlvdSBkb24ndCBkbyBhbnl0aGluZy4g
IFlvdSBjYW4gcHV0IHNvbWUgcHl0aG9uIGNvZGUKPiBpbiB0aGUgbWF0Y2hpbmcgb2YgdGhlIG1l
dGF2YXJpYWJsZXM6Cj4gCj4gdW5zaWduZWQgbG9uZyB1bCA6IHNjcmlwdDpweXRob24oKSB7IHdo
YXRldmVyIHlvdSB3YW50IHRvIGNoZWNrIG9uIHVsIH07Cj4gCj4gVGhlbiBpdCB3aWxsIG9ubHkg
bWF0Y2ggaWYgdGhlIGNvbmRpdGlvbiBpcyBzYXRpc2ZpZWQuCj4gCj4ganVsaWEKPiAKCk9LLCB0
aGFuayB5b3UgdmVyeSBtdWNoLgpXZSdsbCBmaXggaXQgc29vbi4KCi0tIApCZXN0IFdpc2hlcywK
V2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkNvY2Np
IG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1lLmxpcDYu
ZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
