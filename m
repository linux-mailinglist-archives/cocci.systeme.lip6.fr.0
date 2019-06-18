Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F365949D81
	for <lists+cocci@lfdr.de>; Tue, 18 Jun 2019 11:36:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5I9ZnQ2026096;
	Tue, 18 Jun 2019 11:35:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1B1B67780;
	Tue, 18 Jun 2019 11:35:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 58BCC7767
 for <cocci@systeme.lip6.fr>; Tue, 18 Jun 2019 11:35:47 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5I9Zju2014629;
 Tue, 18 Jun 2019 11:35:46 +0200 (CEST)
Received: from [192.168.1.110] ([95.114.66.109]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MALql-1hkZRC0XyV-00Bwv7; Tue, 18 Jun 2019 11:35:37 +0200
To: Markus Elfring <Markus.Elfring@web.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
 <910a5806-9a08-adf4-4fba-d5ec2f5807ff@metux.net>
 <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <714a38fe-a733-7264-bb06-d94bd58a245a@metux.net>
Date: Tue, 18 Jun 2019 11:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <efc38197-f846-142d-fbaf-93327c2669c9@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:QGOge7wGLS9wYOerll1EkGFgYhDGxxcXgNUpFw4ODbRJSI2IvQu
 EgNQDoUgqQPHmht+B4xha2yiDDCKlybReidxeoCxJ+rwoIdIkF5oOJWDdQN/PLJCYmtwsdY
 +k18JXBNva47Mqa/rQYAaiK0ltc20AueHqyQs7YbJfXMYwzLgf15a5PbvYUgkskfDAZUZwZ
 fKheijEjcUDc9U6yv4onQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D189xkVVdIU=:GM0TjioBmaopMMZ9spYJwQ
 /GhJviRrSe4I/q2z8eiefDW9PTfL5f4N4KVWWRcVEqHG9mLc0DA99q6Y0ju2o0fUoCberydJX
 4BC4/bu3rJdvu/cP47IU4PTARHfFiUK45y6i7RwQYXgVZn9JoDM3W+XkPI5iPEPEATyCJTr48
 HOHBKoIO3s8E1tB31GqfjnFmIvI+sfnyNErcJfWbPyz+lzk6bhrmAV9tWvWTElDitBNyMtcrE
 /nw5ALsfbLExblh5UGhOHQ2uC6108yz0eUy7apSIDNa5rgX00meSVXZPR78zyD0uggmsY5ucD
 VkoGTI2PltiXzWFHICPdnK3bkGqXL5Z0Vce6aLH6Vc9Zea+25eUhtIIP6A94NQTTFE8XAronH
 WfI2YM+T6hbasa7Gmv/S412YZJot2Tgwz+Q2lwX1qIcdhTjVTbyjlDvjRWHQdsIhR2mICxgJE
 Bw8X/o9kRGQaN3X9JC1CIYEHsuPZyPQnjYBH/4a80KApu/eVGNztSLllSfiGIX3mNFxnfKHOd
 DHt36lWR3wnKxVUDh7DdQl/87N9x2X2O9Q6+JJ1QLTULsRtXOlRhT+TwSNhG2Ub0GGtTkZa3E
 jyHeGe3ZBj+bR7qPT9nMsJtLr6/o3t26k1xbdQYYSowkC7oC+qFpz3cPNUwBIaukQsuKpSVoE
 a6OxgLI13fyHWNRDnPsF+A7xdgMCyygZ+k/QSX3mWeb+TTNxLPtRvZA1YFE1kver6JbACU4If
 wxOR78EAJ7zu1ExTKYfWAm57352UHhTpWexv9GOB2cuxephEghAJ7PqnbnA=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 18 Jun 2019 11:35:50 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 18 Jun 2019 11:35:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] drivers: Inline code in
 devm_platform_ioremap_resource() from two functions
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

On 18.06.19 07:37, Markus Elfring wrote:
>>> Two function calls were combined in this function implementation.
>>> Inline corresponding code so that extra error checks can be avoided here.
>>
>> What exactly is the purpose of this ?
> 
> I suggest to take another look at the need and relevance of involved
> error checks in the discussed function combination.

Sorry, don't have the time for guessing and trying to reproduce your
thoughts. That's why we have patch descriptions / commit messages.
It would be a lot easier for all of us if you just desribe the exact
problem you'd like to solve and your approach to do so.

>> Looks like a notable code duplication ...
> 
> This can be.

I doubt that code duplication is appreciated, as this increases the
maintenance overhead. (actually, we're usually trying to reduce that,
eg. by using lots of generic helpers).

>> I thought we usually try to reduce this, instead of introducing new ones.
> 
> Would you like to check the software circumstances once more
> for the generation of a similar code structure by a C compiler
> (or optimiser)?

As said: unfortunately, I don't have the time to do that - you'd have to
tell us, what exactly you've got in mind.

If it's just about some error checks which happen to be redundant in a
particular case, you'll have to show that this case is a *really* hot
path (eg. irq, syscall, scheduling, etc) - but I don't see that here.

What's the exact scenario you're trying to optimize ? Any actual
measurements on how your patch improves that ?


Look, I understand that you'd like to squeeze out maximum performance,
but this has to be practically maintainable. I could list a lot of
things that I don't need in particular use cases and would like to
introduce build knobs for, but I have to understand that maintainers
have to be pretty reluctant towards those things.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
