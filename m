Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D81130289
	for <lists+cocci@lfdr.de>; Sat,  4 Jan 2020 14:54:54 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 004DsZHs000904;
	Sat, 4 Jan 2020 14:54:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5D6BA77F5;
	Sat,  4 Jan 2020 14:54:35 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8BB0173E2
 for <cocci@systeme.lip6.fr>; Sat,  4 Jan 2020 14:54:33 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 004DsW7W006034
 for <cocci@systeme.lip6.fr>; Sat, 4 Jan 2020 14:54:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,394,1571695200"; d="scan'208";a="429877340"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2020 14:54:32 +0100
Date: Sat, 4 Jan 2020 14:54:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Wen Yang <wenyang@linux.alibaba.com>
In-Reply-To: <b98d1f9e-a32f-7c85-996c-2c604a014af2@linux.alibaba.com>
Message-ID: <alpine.DEB.2.21.2001041454020.6944@hadrien>
References: <20200104064448.24314-1-wenyang@linux.alibaba.com>
 <alpine.DEB.2.21.2001040759360.2636@hadrien>
 <7d9d8f10-7eb6-ffc3-5084-5ed1a08d4bcb@linux.alibaba.com>
 <alpine.DEB.2.21.2001040951450.2636@hadrien>
 <b98d1f9e-a32f-7c85-996c-2c604a014af2@linux.alibaba.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1115077898-1578146072=:6944"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 04 Jan 2020 14:54:35 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 04 Jan 2020 14:54:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: semantic patch to check for
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1115077898-1578146072=:6944
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



--- Please note the new email address ---


On Sat, 4 Jan 2020, Wen Yang wrote:

>
>
> On 2020/1/4 4:55 下午, Julia Lawall wrote:
> > On Sat, 4 Jan 2020, Wen Yang wrote:
> >
> > >
> > >
> > > On 2020/1/4 3:00 下午, Julia Lawall wrote:
> > > > On Sat, 4 Jan 2020, Wen Yang wrote:
> > > >
> > > > > do_div() does a 64-by-32 division.
> > > > > When the divisor is unsigned long, u64, or s64,
> > > > > do_div() truncates it to 32 bits, this means it
> > > > > can test non-zero and be truncated to zero for division.
> > > > > This semantic patch is inspired by Mateusz Guzik's patch:
> > > > > commit b0ab99e7736a ("sched: Fix possible divide by zero in avg_atom()
> > > > > calculation")
> > > > >
> > > > > Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
> > > > > Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> > > > > Cc: Gilles Muller <Gilles.Muller@lip6.fr>
> > > > > Cc: Nicolas Palix <nicolas.palix@imag.fr>
> > > > > Cc: Michal Marek <michal.lkml@markovi.net>
> > > > > Cc: Matthias Maennich <maennich@google.com>
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > Cc: cocci@systeme.lip6.fr
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > ---
> > > > >    scripts/coccinelle/misc/do_div.cocci | 66
> > > > > ++++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 66 insertions(+)
> > > > >    create mode 100644 scripts/coccinelle/misc/do_div.cocci
> > > > >
> > > > > diff --git a/scripts/coccinelle/misc/do_div.cocci
> > > > > b/scripts/coccinelle/misc/do_div.cocci
> > > > > new file mode 100644
> > > > > index 0000000..f1b72d1
> > > > > --- /dev/null
> > > > > +++ b/scripts/coccinelle/misc/do_div.cocci
> > > > > @@ -0,0 +1,66 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/// do_div() does a 64-by-32 division.
> > > > > +/// When the divisor is unsigned long, u64, or s64,
> > > > > +/// do_div() truncates it to 32 bits, this means it
> > > > > +/// can test non-zero and be truncated to zero for division.
> > > > > +///
> > > > > +//# This makes an effort to find those inappropriate do_div () calls.
> > > > > +//
> > > > > +// Confidence: Moderate
> > > > > +// Copyright: (C) 2020 Wen Yang, Alibaba.
> > > > > +// Comments:
> > > > > +// Options: --no-includes --include-headers
> > > > > +
> > > > > +virtual context
> > > > > +virtual org
> > > > > +virtual report
> > > > > +
> > > > > +@depends on context@
> > > > > +expression f;
> > > > > +long l;
> > > > > +unsigned long ul;
> > > > > +u64 ul64;
> > > > > +s64 sl64;
> > > > > +
> > > > > +@@
> > > > > +(
> > > > > +* do_div(f, l);
> > > > > +|
> > > > > +* do_div(f, ul);
> > > > > +|
> > > > > +* do_div(f, ul64);
> > > > > +|
> > > > > +* do_div(f, sl64);
> > > > > +)
> > > > > +
> > > > > +@r depends on (org || report)@
> > > > > +expression f;
> > > > > +long l;
> > > > > +unsigned long ul;
> > > > > +position p;
> > > > > +u64 ul64;
> > > > > +s64 sl64;
> > > > > +@@
> > > > > +(
> > > > > +do_div@p(f, l);
> > > > > +|
> > > > > +do_div@p(f, ul);
> > > > > +|
> > > > > +do_div@p(f, ul64);
> > > > > +|
> > > > > +do_div@p(f, sl64);
> > > > > +)
> > > > > +
> > > > > +@script:python depends on org@
> > > > > +p << r.p;
> > > > > +@@
> > > > > +
> > > > > +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may
> > > > > truncation the divisor to 32-bit"
> > > > > +coccilib.org.print_todo(p[0], msg)
> > > > > +
> > > > > +@script:python depends on report@
> > > > > +p << r.p;
> > > > > +@@
> > > > > +
> > > > > +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may
> > > > > truncation the divisor to 32-bit"
> > > > > +coccilib.report.print_report(p[0], msg)
> > > >
> > > > A few small issues: You have WARNING: twice in each case, and truncation
> > > > should be truncate.
> > > >
> > >
> > > Thanks for your comments, we will fix it soon.
> > >
> > > > Is there any generic strategy for fixing these issues?
> > > >
> > >
> > > We have done some experiments, such as:
> > > https://lkml.org/lkml/2020/1/2/1354
> >
> > Thanks.  Actually, I would appreciate knowing about such experiments when
> > the semantic patch is submitted, since eg in this case I am not really an
> > expert in this issue.
> >
> > >
> > > -	avg = rec->time;
> > > -	do_div(avg, rec->counter);
> > > +	avg = div64_ul(rec->time, rec->counter);
> > >
> > > --> Function replacement was performed here,
> > >      and simple code cleanup was also performed.
> > >
> > >
> > > -		do_div(stddev, rec->counter * (rec->counter - 1) * 1000);
> > > +		stddev = div64_ul(stddev,
> > > +				  rec->counter * (rec->counter - 1) * 1000);
> > >
> > > --> Only the function replacement is performed here (because the variable
> > > ‘stddev’ corresponds to a more complicated equation, cleaning it will
> > > reduce
> > > readability).
> >
> > Would it be reasonable to extend the warning to say "consider using
> > div64_ul instead"?  Or do you think it is obvious to everyone?
> >
>
> Thank you for your comments.
> We plan to modify it as follows:
> msg="WARNING: do_div() does a 64-by-32 division, please consider using
> div64_ul, div64_long, div64_u64 or div64_s64 instead."

This message seems helpful, thanks.

julia

>
> > > In addition, there are some codes that do not need to be modified:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/net/can/dev.c#n263
> >
> > Would it be worth having a special case for constants and checking whether
> > the value is obviously safe and no warning is needed?
> >
> Thanks.
> This is very valuable in reducing false positives, and we'll try to implement
> it.
>
> --
> Best Wishes,
> Wen
>
> > > So we just print a warning.
> > > As for how to fix it, we need to analyze the code carefully.
> > >
> > > --
> > > Best Wishes,
> > > Wen
> > >
> > >
> > >
> >
>
--8323329-1115077898-1578146072=:6944
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1115077898-1578146072=:6944--
