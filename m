Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67EA9BFD
	for <lists+cocci@lfdr.de>; Thu,  5 Sep 2019 09:38:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x857aaKm017479;
	Thu, 5 Sep 2019 09:36:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CB80077A0;
	Thu,  5 Sep 2019 09:36:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7FF40778F
 for <cocci@systeme.lip6.fr>; Thu,  5 Sep 2019 09:36:35 +0200 (CEST)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x857aYKs023925
 for <cocci@systeme.lip6.fr>; Thu, 5 Sep 2019 09:36:34 +0200 (CEST)
Received: by mail-lf1-f68.google.com with SMTP id u29so1121263lfk.7
 for <cocci@systeme.lip6.fr>; Thu, 05 Sep 2019 00:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k2T9+4yCg/nj22t+epOd3cFsZ2Dp5yvNb3cPsYW2e68=;
 b=Syi8ylT6HmUMpyKVNhANTTaxyZHyj4nZ2RayoxScsFEGhCxMrvHX1iU49YifE0IeqR
 MYqTiTBqdDeCODX2VkmwEcXsFKMzpLc2BkZp3EDEzv+TLy1v/I2RWCWtZz3rkSWyCYNd
 JxnQ4bL5zh58G90HHRJQCD49i7ucDdhEPKhUfbaKh1xOizQ+Qs1xA6eT35dGKuCmMnvh
 i5HZBPp+koPQ5ROKRBwgLQ4yy3FYYxG/H+6VI4G2HPElu5XvxNarS5/z8/uKORTuRIYR
 wvpCxg4jMg6ZVXtm6BLs36x4Y+IBPTXLglulqsBCxcAuBWwUlgkJGdCaNmW4JFvVUM/O
 yd3g==
X-Gm-Message-State: APjAAAUgh19eBmxySTTc20BFQbJeobx8l/NZzeErd1h+yfzJABlE4ObE
 1h3Reg3MyYxDVYQ0cPEhF7o=
X-Google-Smtp-Source: APXvYqy9rn677gYfY4pdkqXuzmif6s2DoTq9rKFWfrqEEptNS26auCjeUi4G1MQrVQVuek6Z9BJjew==
X-Received: by 2002:a19:c191:: with SMTP id r139mr1343662lff.23.1567668994388; 
 Thu, 05 Sep 2019 00:36:34 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id y22sm216706ljj.97.2019.09.05.00.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2019 00:36:33 -0700 (PDT)
To: Julia Lawall <julia.lawall@lip6.fr>
References: <20190904221223.5281-1-efremov@linux.com>
 <alpine.DEB.2.21.1909050816370.2815@hadrien>
From: Denis Efremov <efremov@linux.com>
Message-ID: <8916c9d9-bdf5-51c2-b5cb-49898e14a00c@linux.com>
Date: Thu, 5 Sep 2019 10:36:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909050816370.2815@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 05 Sep 2019 09:36:39 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 05 Sep 2019 09:36:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [RFC PATCH] coccinelle: check for integer overflow in
 binary search
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On 05.09.2019 09:20, Julia Lawall wrote:
> 
> 
> On Thu, 5 Sep 2019, Denis Efremov wrote:
> 
>> This is an RFC. I will resend the patch after feedback. Currently
>> I'm preparing big patchset with bsearch warnings fixed. The rule will
>> be a part of this patchset if it will be considered good enough for
>> checking.
>>
>> There is a known integer overflow error [1] in the binary search
>> algorithm. Google faced it in 2006 [2]. This rule checks midpoint
>> calculation in binary search for overflow, i.e., (l + h) / 2.
>> Not every match is an actual error since the array could be small
>> enough. However, a custom implementation of binary search is
>> error-prone and it's better to use the library function (lib/bsearch.c)
>> or to apply defensive programming for midpoint calculation.
>>
>> [1] https://en.wikipedia.org/wiki/Binary_search_algorithm#Implementation_issues
>> [2] https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
>>
>> Signed-off-by: Denis Efremov <efremov@linux.com>
>> ---
>>  scripts/coccinelle/misc/bsearch.cocci | 80 +++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>  create mode 100644 scripts/coccinelle/misc/bsearch.cocci
>>
>> diff --git a/scripts/coccinelle/misc/bsearch.cocci b/scripts/coccinelle/misc/bsearch.cocci
>> new file mode 100644
>> index 000000000000..a99d9a8d3ee5
>> --- /dev/null
>> +++ b/scripts/coccinelle/misc/bsearch.cocci
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/// Check midpoint calculation in binary search algorithm for integer overflow
>> +/// error [1]. Google faced it in 2006 [2]. Not every match is an actual error
>> +/// since the array can be small enough. However, a custom implementation of
>> +/// binary search is error-prone and it's better to use the library function
>> +/// (lib/bsearch.c) or to apply defensive programming for midpoint calculation.
>> +///
>> +/// [1] https://en.wikipedia.org/wiki/Binary_search_algorithm#Implementation_issues
>> +/// [2] https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
>> +//
>> +// Confidence: Medium
>> +// Copyright: (C) 2019 Denis Efremov, ISPRAS
>> +// Comments:
>> +// Options: --no-includes --include-headers
>> +
>> +virtual report
>> +virtual org
>> +
>> +@r depends on org || report@
>> +identifier l, h, m;
>> +statement S;
>> +position p;
>> +// to match 1 in <<
>> +// to match 2 in /
>> +// Can't use exact values, e.g. 2, because it fails to match 2L.
>> +// TODO: Is there an isomorphism for 2, 2L, 2U, 2UL, 2ULL, etc?
>> +constant c;
> 
> As far as I can see, you aren't checking for 2 at all at the moment?

Yes, there are no false positives even without pinning constants to 1, 2.
However, it's better to express this in the rule.

> You
> should be able to say constant c = {2, 2L, etc};.  Actually, we do
> consider several variants of 0, so it could be reasonable to allow eg 2 to
> match other variants as well.

It looks like integer literals aren't fully supported. When I'm trying to write
'constant c = {2L}; ' it fails with int_of_string error.

Denis
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
