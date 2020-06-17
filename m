Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB751FD5BE
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 22:08:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05HK8N5q024848;
	Wed, 17 Jun 2020 22:08:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E1862781F;
	Wed, 17 Jun 2020 22:08:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7D2193D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:08:21 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05HK8KJK007411
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:08:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; d="scan'208";a="351904042"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 22:08:19 +0200
Date: Wed, 17 Jun 2020 22:08:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <e34b7e26-6f07-19b6-39ad-e3bc939551fc@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006172154040.3083@hadrien>
References: <20200615102045.4558-1-efremov@linux.com>
 <202006151123.3C2CB7782@keescook>
 <a28543e5-4f93-bf16-930b-42d7b24ab902@linux.com>
 <4dd9c371-0c37-a4bb-e957-3848cb1a13ff@embeddedor.com>
 <e34b7e26-6f07-19b6-39ad-e3bc939551fc@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:08:23 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:08:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: misc: add array_size_dup script to
 detect missed overlow checks
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



On Wed, 17 Jun 2020, Denis Efremov wrote:

>
> >
> > Awesome! I'll take a look into this. :)
> >
> Here is another script for your #83 ticket.
> Currently, it issues 598 warnings.
>
> // SPDX-License-Identifier: GPL-2.0-only
> ///
> /// Check for missing overflow checks in allocation functions.
> /// Low confidence because it's pointless to check for overflow
> /// relatively small allocations.
> ///
> // Confidence: Low
> // Copyright: (C) 2020 Denis Efremov ISPRAS
> // Options: --no-includes --include-headers
>
> virtual patch
> virtual context
> virtual org
> virtual report
>
> @depends on patch@
> expression E1, E2, E3, E4, size;
> @@
>
> (
> - size = E1 * E2;
> + size = array_size(E1, E2);
> |
> - size = E1 * E2 * E3;
> + size = array3_size(E1, E2, E3);
> |
> - size = E1 * E2 + E3;
> + size = struct_size(E1, E2, E3);

Should the arguments be checked to see if they have something to do with
arrays and structures?

> )
>   ... when != size = E4
>       when != size += E4
>       when != size -= E4
>       when != size *= E4

Here you can have a metavariable

assignment operator aop;

and then say size aop E4

It doesn't really look like an assignment any more, but it could be a
little safer.

julia

>       when != &size
>   \(kmalloc\|krealloc\|kzalloc\|kzalloc_node\|
>     vmalloc\|vzalloc\|vzalloc_node\|
>     kvmalloc\|kvzalloc\|kvzalloc_node\|
>     sock_kmalloc\|
>     f2fs_kmalloc\|f2fs_kzalloc\|f2fs_kvmalloc\|f2fs_kvzalloc\|
>     devm_kmalloc\|devm_kzalloc\)
>   (..., size, ...)
>
> @r depends on !patch@
> expression E1, E2, E3, E4, size;
> position p;
> @@
>
> (
> * size = E1 * E2;@p
> |
> * size = E1 * E2 * E3;@p
> |
> * size = E1 * E2 + E3;@p
> )
>   ... when != size = E4
>       when != size += E4
>       when != size -= E4
>       when != size *= E4
>       when != &size
> * \(kmalloc\|krealloc\|kzalloc\|kzalloc_node\|
>     vmalloc\|vzalloc\|vzalloc_node\|
>     kvmalloc\|kvzalloc\|kvzalloc_node\|
>     sock_kmalloc\|
>     f2fs_kmalloc\|f2fs_kzalloc\|f2fs_kvmalloc\|f2fs_kvzalloc\|
>     devm_kmalloc\|devm_kzalloc\)
>   (..., size, ...)
>
> @script:python depends on report@
> p << r.p;
> @@
>
> coccilib.report.print_report(p[0], "WARNING: missing overflow check")
>
> @script:python depends on org@
> p << r.p;
> @@
>
> coccilib.org.print_todo(p[0], "WARNING: missing overflow check")
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
