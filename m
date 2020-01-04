Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEA130149
	for <lists+cocci@lfdr.de>; Sat,  4 Jan 2020 08:17:20 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0047H1hL014814;
	Sat, 4 Jan 2020 08:17:01 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A5C0077F5;
	Sat,  4 Jan 2020 08:17:01 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0F64F73E2
 for <cocci@systeme.lip6.fr>; Sat,  4 Jan 2020 08:17:00 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0047GxRr002090
 for <cocci@systeme.lip6.fr>; Sat, 4 Jan 2020 08:16:59 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,393,1571695200"; d="scan'208";a="334728961"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2020 08:16:58 +0100
Date: Sat, 4 Jan 2020 08:16:58 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Wen Yang <wenyang@linux.alibaba.com>
In-Reply-To: <20200104064448.24314-1-wenyang@linux.alibaba.com>
Message-ID: <alpine.DEB.2.21.2001040815230.2636@hadrien>
References: <20200104064448.24314-1-wenyang@linux.alibaba.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 04 Jan 2020 08:17:02 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 04 Jan 2020 08:16:59 +0100 (CET)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



--- Please note the new email address ---


On Sat, 4 Jan 2020, Wen Yang wrote:

> do_div() does a 64-by-32 division.
> When the divisor is unsigned long, u64, or s64,
> do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.

Would it be worth having a specific warning message for the long/unsigned
long case?  If the target architecture has 32 bit longs then the warning
can be immediately ignored.

julia


> This semantic patch is inspired by Mateusz Guzik's patch:
> commit b0ab99e7736a ("sched: Fix possible divide by zero in avg_atom() calculation")
>
> Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
> Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> Cc: Gilles Muller <Gilles.Muller@lip6.fr>
> Cc: Nicolas Palix <nicolas.palix@imag.fr>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Matthias Maennich <maennich@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: cocci@systeme.lip6.fr
> Cc: linux-kernel@vger.kernel.org
> ---
>  scripts/coccinelle/misc/do_div.cocci | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/do_div.cocci
>
> diff --git a/scripts/coccinelle/misc/do_div.cocci b/scripts/coccinelle/misc/do_div.cocci
> new file mode 100644
> index 0000000..f1b72d1
> --- /dev/null
> +++ b/scripts/coccinelle/misc/do_div.cocci
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/// do_div() does a 64-by-32 division.
> +/// When the divisor is unsigned long, u64, or s64,
> +/// do_div() truncates it to 32 bits, this means it
> +/// can test non-zero and be truncated to zero for division.
> +///
> +//# This makes an effort to find those inappropriate do_div () calls.
> +//
> +// Confidence: Moderate
> +// Copyright: (C) 2020 Wen Yang, Alibaba.
> +// Comments:
> +// Options: --no-includes --include-headers
> +
> +virtual context
> +virtual org
> +virtual report
> +
> +@depends on context@
> +expression f;
> +long l;
> +unsigned long ul;
> +u64 ul64;
> +s64 sl64;
> +
> +@@
> +(
> +* do_div(f, l);
> +|
> +* do_div(f, ul);
> +|
> +* do_div(f, ul64);
> +|
> +* do_div(f, sl64);
> +)
> +
> +@r depends on (org || report)@
> +expression f;
> +long l;
> +unsigned long ul;
> +position p;
> +u64 ul64;
> +s64 sl64;
> +@@
> +(
> +do_div@p(f, l);
> +|
> +do_div@p(f, ul);
> +|
> +do_div@p(f, ul64);
> +|
> +do_div@p(f, sl64);
> +)
> +
> +@script:python depends on org@
> +p << r.p;
> +@@
> +
> +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may truncation the divisor to 32-bit"
> +coccilib.org.print_todo(p[0], msg)
> +
> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may truncation the divisor to 32-bit"
> +coccilib.report.print_report(p[0], msg)
> --
> 1.8.3.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
