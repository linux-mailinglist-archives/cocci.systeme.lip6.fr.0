Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF6342FAB
	for <lists+cocci@lfdr.de>; Sat, 20 Mar 2021 22:32:05 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12KLVPoe016277;
	Sat, 20 Mar 2021 22:31:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8BE2C77E4;
	Sat, 20 Mar 2021 22:31:25 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 41FCA24DD
 for <cocci@systeme.lip6.fr>; Sat, 20 Mar 2021 22:31:23 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12KLVMS5008550
 for <cocci@systeme.lip6.fr>; Sat, 20 Mar 2021 22:31:22 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AhJXV267h1n4gSWqyaQPXwHrXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz73HJoRsyeFVlo9CPP6GcXWjRnKQe3aA9NaqvNTOLhE?=
 =?us-ascii?q?KGN4dnhLGD/xTEGzfistJbz7tqaaJkCNb9ZGIK6PrSxQmjDpIdx8Oa+7qjnufU?=
 =?us-ascii?q?wzNVSxt2ApsQiztRLia+PglISBJdBZw/faDw2uNiqyC7cXoaKuSXb0NrY8H5q9?=
 =?us-ascii?q?fGlI3rbHc9bnZN1CC0gSqs+PrGFXGjr3QjeghC3Ks49iz9mxH5j5/T1M2T8APW?=
 =?us-ascii?q?1GPY8v1t+efJ990rPr3vtuElbhHhkByhaogkZq2asFkO0YeS1Go=3D?=
X-IronPort-AV: E=Sophos;i="5.81,265,1610406000"; d="scan'208";a="376348230"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2021 22:31:22 +0100
Date: Sat, 20 Mar 2021 22:31:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20210309063903.13231-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2103202231080.3075@hadrien>
References: <20210216160326.1341741-1-efremov@linux.com>
 <20210309063903.13231-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 20 Mar 2021 22:31:29 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 20 Mar 2021 22:31:22 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v5] coccinelle: misc: add minmax script
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



On Tue, 9 Mar 2021, Denis Efremov wrote:

> Check for opencoded min(), max() implementations.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied, thanks.

julia

> ---
> Changes in v2:
>  - <... ...> instead of ... when any
>  - org mode reports fixed
>  - patch rule to drop excessive ()
> Changes in v3:
>  - "depends on patch && (pmax || pmaxif || pmin || pminif)" fixed
> Changes in v4:
>  - refarmatting rule removed
>  - () brackets added to the patch rules to omit excessive ones
>  - org/report prints changed to cycle (for p0 in p: ...)
> Changes in v5:
>  - parentheses droppped in pminif and pmaxif rules (max_val = x ...)
>
>  scripts/coccinelle/misc/minmax.cocci | 206 +++++++++++++++++++++++++++
>  1 file changed, 206 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/minmax.cocci
>
> diff --git a/scripts/coccinelle/misc/minmax.cocci b/scripts/coccinelle/misc/minmax.cocci
> new file mode 100644
> index 000000000000..eccdd3eb3452
> --- /dev/null
> +++ b/scripts/coccinelle/misc/minmax.cocci
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Check for opencoded min(), max() implementations.
> +/// Generated patches sometimes require adding a cast to fix compile warning.
> +/// Warnings/patches scope intentionally limited to a function body.
> +///
> +// Confidence: Medium
> +// Copyright: (C) 2021 Denis Efremov ISPRAS
> +// Options: --no-includes --include-headers
> +//
> +// Keywords: min, max
> +//
> +
> +
> +virtual report
> +virtual org
> +virtual context
> +virtual patch
> +
> +@rmax depends on !patch@
> +identifier func;
> +expression x, y;
> +binary operator cmp = {>, >=};
> +position p;
> +@@
> +
> +func(...)
> +{
> +	<...
> +*	((x) cmp@p (y) ? (x) : (y))
> +	...>
> +}
> +
> +@rmaxif depends on !patch@
> +identifier func;
> +expression x, y;
> +expression max_val;
> +binary operator cmp = {>, >=};
> +position p;
> +@@
> +
> +func(...)
> +{
> +	<...
> +*	if ((x) cmp@p (y)) {
> +*		max_val = (x);
> +*	} else {
> +*		max_val = (y);
> +*	}
> +	...>
> +}
> +
> +@rmin depends on !patch@
> +identifier func;
> +expression x, y;
> +binary operator cmp = {<, <=};
> +position p;
> +@@
> +
> +func(...)
> +{
> +	<...
> +*	((x) cmp@p (y) ? (x) : (y))
> +	...>
> +}
> +
> +@rminif depends on !patch@
> +identifier func;
> +expression x, y;
> +expression min_val;
> +binary operator cmp = {<, <=};
> +position p;
> +@@
> +
> +func(...)
> +{
> +	<...
> +*	if ((x) cmp@p (y)) {
> +*		min_val = (x);
> +*	} else {
> +*		min_val = (y);
> +*	}
> +	...>
> +}
> +
> +@pmax depends on patch@
> +identifier func;
> +expression x, y;
> +binary operator cmp = {>=, >};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	((x) cmp (y) ? (x) : (y))
> ++	max(x, y)
> +	...>
> +}
> +
> +@pmaxif depends on patch@
> +identifier func;
> +expression x, y;
> +expression max_val;
> +binary operator cmp = {>=, >};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	if ((x) cmp (y)) {
> +-		max_val = x;
> +-	} else {
> +-		max_val = y;
> +-	}
> ++	max_val = max(x, y);
> +	...>
> +}
> +
> +@pmin depends on patch@
> +identifier func;
> +expression x, y;
> +binary operator cmp = {<=, <};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	((x) cmp (y) ? (x) : (y))
> ++	min(x, y)
> +	...>
> +}
> +
> +@pminif depends on patch@
> +identifier func;
> +expression x, y;
> +expression min_val;
> +binary operator cmp = {<=, <};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	if ((x) cmp (y)) {
> +-		min_val = x;
> +-	} else {
> +-		min_val = y;
> +-	}
> ++	min_val = min(x, y);
> +	...>
> +}
> +
> +@script:python depends on report@
> +p << rmax.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on org@
> +p << rmax.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on report@
> +p << rmaxif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on org@
> +p << rmaxif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on report@
> +p << rmin.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on org@
> +p << rmin.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on report@
> +p << rminif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on org@
> +p << rminif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for min()")
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
