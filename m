Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EFA9C33
	for <lists+cocci@lfdr.de>; Thu,  5 Sep 2019 09:52:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x857pW9c000409;
	Thu, 5 Sep 2019 09:51:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4FA4E77A0;
	Thu,  5 Sep 2019 09:51:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1C0DF778F
 for <cocci@systeme.lip6.fr>; Thu,  5 Sep 2019 09:51:30 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x857pTKx019115
 for <cocci@systeme.lip6.fr>; Thu, 5 Sep 2019 09:51:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,469,1559512800"; d="scan'208";a="400347690"
Received: from unknown (HELO hadrien) ([132.227.124.24])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 09:51:28 +0200
Date: Thu, 5 Sep 2019 09:51:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <8916c9d9-bdf5-51c2-b5cb-49898e14a00c@linux.com>
Message-ID: <alpine.DEB.2.21.1909050950100.2357@hadrien>
References: <20190904221223.5281-1-efremov@linux.com>
 <alpine.DEB.2.21.1909050816370.2815@hadrien>
 <8916c9d9-bdf5-51c2-b5cb-49898e14a00c@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 05 Sep 2019 09:51:32 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 05 Sep 2019 09:51:29 +0200 (CEST)
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



On Thu, 5 Sep 2019, Denis Efremov wrote:

>
>
> On 05.09.2019 09:20, Julia Lawall wrote:
> >
> >
> > On Thu, 5 Sep 2019, Denis Efremov wrote:
> >
> >> This is an RFC. I will resend the patch after feedback. Currently
> >> I'm preparing big patchset with bsearch warnings fixed. The rule will
> >> be a part of this patchset if it will be considered good enough for
> >> checking.
> >>
> >> There is a known integer overflow error [1] in the binary search
> >> algorithm. Google faced it in 2006 [2]. This rule checks midpoint
> >> calculation in binary search for overflow, i.e., (l + h) / 2.
> >> Not every match is an actual error since the array could be small
> >> enough. However, a custom implementation of binary search is
> >> error-prone and it's better to use the library function (lib/bsearch.c)
> >> or to apply defensive programming for midpoint calculation.
> >>
> >> [1] https://en.wikipedia.org/wiki/Binary_search_algorithm#Implementation_issues
> >> [2] https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
> >>
> >> Signed-off-by: Denis Efremov <efremov@linux.com>
> >> ---
> >>  scripts/coccinelle/misc/bsearch.cocci | 80 +++++++++++++++++++++++++++
> >>  1 file changed, 80 insertions(+)
> >>  create mode 100644 scripts/coccinelle/misc/bsearch.cocci
> >>
> >> diff --git a/scripts/coccinelle/misc/bsearch.cocci b/scripts/coccinelle/misc/bsearch.cocci
> >> new file mode 100644
> >> index 000000000000..a99d9a8d3ee5
> >> --- /dev/null
> >> +++ b/scripts/coccinelle/misc/bsearch.cocci
> >> @@ -0,0 +1,80 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/// Check midpoint calculation in binary search algorithm for integer overflow
> >> +/// error [1]. Google faced it in 2006 [2]. Not every match is an actual error
> >> +/// since the array can be small enough. However, a custom implementation of
> >> +/// binary search is error-prone and it's better to use the library function
> >> +/// (lib/bsearch.c) or to apply defensive programming for midpoint calculation.
> >> +///
> >> +/// [1] https://en.wikipedia.org/wiki/Binary_search_algorithm#Implementation_issues
> >> +/// [2] https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
> >> +//
> >> +// Confidence: Medium
> >> +// Copyright: (C) 2019 Denis Efremov, ISPRAS
> >> +// Comments:
> >> +// Options: --no-includes --include-headers
> >> +
> >> +virtual report
> >> +virtual org
> >> +
> >> +@r depends on org || report@
> >> +identifier l, h, m;
> >> +statement S;
> >> +position p;
> >> +// to match 1 in <<
> >> +// to match 2 in /
> >> +// Can't use exact values, e.g. 2, because it fails to match 2L.
> >> +// TODO: Is there an isomorphism for 2, 2L, 2U, 2UL, 2ULL, etc?
> >> +constant c;
> >
> > As far as I can see, you aren't checking for 2 at all at the moment?
>
> Yes, there are no false positives even without pinning constants to 1, 2.
> However, it's better to express this in the rule.
>
> > You
> > should be able to say constant c = {2, 2L, etc};.  Actually, we do
> > consider several variants of 0, so it could be reasonable to allow eg 2 to
> > match other variants as well.
>
> It looks like integer literals aren't fully supported. When I'm trying to write
> 'constant c = {2L}; ' it fails with int_of_string error.

Oops.  I'll fix it, but since people may be using older versions of
Coccinelle, perhaps it is not worth taking this strategy in this case.
Could you make a disjunction, or check for the proper value in the python
code?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
