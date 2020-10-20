Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D7228268A
	for <lists+cocci@lfdr.de>; Sat,  3 Oct 2020 22:10:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 093K9fZU005945;
	Sat, 3 Oct 2020 22:09:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2D8AD77BC;
	Sat,  3 Oct 2020 22:09:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 027A7578C
 for <cocci@systeme.lip6.fr>; Sat,  3 Oct 2020 22:09:39 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 093K9aNt029832
 for <cocci@systeme.lip6.fr>; Sat, 3 Oct 2020 22:09:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,333,1596492000"; d="scan'208";a="470813160"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2020 22:09:36 +0200
Date: Sat, 3 Oct 2020 22:09:36 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20200921174920.87241-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2010032209270.2741@hadrien>
References: <20200806220342.25426-1-efremov@linux.com>
 <20200921174920.87241-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 03 Oct 2020 22:09:43 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 03 Oct 2020 22:09:36 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, cocci@systeme.lip6.fr,
        Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v3] coccinelle: misc: add flexible_array.cocci
	script
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



On Mon, 21 Sep 2020, Denis Efremov wrote:

> One-element and zero-length arrays are deprecated [1]. Kernel
> code should always use "flexible array members" instead, except
> for existing uapi definitions.
>
> The script warns about one-element and zero-length arrays in structs.
>
> [1] commit 68e4cd17e218 ("docs: deprecated.rst: Add zero-length and
>     one-element arrays")
>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied, thanks.


> ---
> Changes in v2:
>  - all uapi headers are now filtered-out. Unfortunately, coccinelle
>    doesn't provide structure names in Location.current_element.
>    For structures the field is always "something_else". Thus, there is
>    no easy way to create a list of existing structures in uapi headers
>    and suppress the warning only for them, but not for the newly added
>    uapi structures.
>  - The pattern doesn't require 2+ fields in a structure/union anymore.
>    Now it also checks single field structures/unions.
>  - The pattern simplified and now uses disjuction in array elements
>    (Thanks, Markus)
>  - Unions are removed from patch mode
>  - one-element arrays are removed from patch mode. Correct patch may
>    involve turning the array to a simple field instead of a flexible
>    array.
> Changes in v3:
>  - exists removed from "depends on patch"
>  - position argument fixed in org mode
>  - link to the online documentation added to the warning message
>
>  scripts/coccinelle/misc/flexible_array.cocci | 88 ++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/flexible_array.cocci
>
> diff --git a/scripts/coccinelle/misc/flexible_array.cocci b/scripts/coccinelle/misc/flexible_array.cocci
> new file mode 100644
> index 000000000000..947fbaff82a9
> --- /dev/null
> +++ b/scripts/coccinelle/misc/flexible_array.cocci
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Zero-length and one-element arrays are deprecated, see
> +/// Documentation/process/deprecated.rst
> +/// Flexible-array members should be used instead.
> +///
> +//
> +// Confidence: High
> +// Copyright: (C) 2020 Denis Efremov ISPRAS.
> +// Comments:
> +// Options: --no-includes --include-headers
> +
> +virtual context
> +virtual report
> +virtual org
> +virtual patch
> +
> +@initialize:python@
> +@@
> +def relevant(positions):
> +    for p in positions:
> +        if "uapi" in p.file:
> +             return False
> +    return True
> +
> +@r depends on !patch@
> +identifier name, array;
> +type T;
> +position p : script:python() { relevant(p) };
> +@@
> +
> +(
> +  struct name {
> +    ...
> +*   T array@p[\(0\|1\)];
> +  };
> +|
> +  struct {
> +    ...
> +*   T array@p[\(0\|1\)];
> +  };
> +|
> +  union name {
> +    ...
> +*   T array@p[\(0\|1\)];
> +  };
> +|
> +  union {
> +    ...
> +*   T array@p[\(0\|1\)];
> +  };
> +)
> +
> +@depends on patch@
> +identifier name, array;
> +type T;
> +position p : script:python() { relevant(p) };
> +@@
> +
> +(
> +  struct name {
> +    ...
> +    T array@p[
> +-       0
> +    ];
> +  };
> +|
> +  struct {
> +    ...
> +    T array@p[
> +-       0
> +    ];
> +  };
> +)
> +
> +@script: python depends on report@
> +p << r.p;
> +@@
> +
> +msg = "WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)"
> +coccilib.report.print_report(p[0], msg)
> +
> +@script: python depends on org@
> +p << r.p;
> +@@
> +
> +msg = "WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)"
> +coccilib.org.print_todo(p[0], msg)
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
