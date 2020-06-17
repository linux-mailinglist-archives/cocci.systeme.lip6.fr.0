Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 523131FD604
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 22:28:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05HKRnTX016127;
	Wed, 17 Jun 2020 22:27:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 34266781F;
	Wed, 17 Jun 2020 22:27:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A76AA3D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:27:47 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05HKRhnM010890
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:27:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; d="scan'208";a="455254845"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 22:27:43 +0200
Date: Wed, 17 Jun 2020 22:27:43 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20200615130242.11825-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006172225570.3083@hadrien>
References: <20200615130242.11825-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:27:49 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:27:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: api: add device_attr_show script
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



On Mon, 15 Jun 2020, Denis Efremov wrote:

> According to the documentation[1] show() methods of device attributes
> should return the number of bytes printed into the buffer. This is
> the return value of scnprintf(). show() must not use snprintf()
> when formatting the value to be returned to user space. snprintf()
> returns the length the resulting string would be, assuming it all
> fit into the destination array[2]. scnprintf() return the length of
> the string actually created in buf. If one can guarantee that an
> overflow will never happen sprintf() can be used otherwise scnprintf().

The semantic patch looks fine.  Do you have any accepted patches from
this?

julia


>
> [1] Documentation/filesystems/sysfs.txt
> [2] "snprintf() confusion" https://lwn.net/Articles/69419/
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/coccinelle/api/device_attr_show.cocci | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 scripts/coccinelle/api/device_attr_show.cocci
>
> diff --git a/scripts/coccinelle/api/device_attr_show.cocci b/scripts/coccinelle/api/device_attr_show.cocci
> new file mode 100644
> index 000000000000..d8ec4bb8ac41
> --- /dev/null
> +++ b/scripts/coccinelle/api/device_attr_show.cocci
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// From Documentation/filesystems/sysfs.txt:
> +///  show() must not use snprintf() when formatting the value to be
> +///  returned to user space. If you can guarantee that an overflow
> +///  will never happen you can use sprintf() otherwise you must use
> +///  scnprintf().
> +///
> +// Confidence: High
> +// Copyright: (C) 2020 Denis Efremov ISPRAS
> +// Options: --no-includes --include-headers
> +//
> +
> +virtual report
> +virtual org
> +virtual context
> +virtual patch
> +
> +@r depends on !patch@
> +identifier show, dev, attr, buf;
> +position p;
> +@@
> +
> +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	<...
> +*	return snprintf@p(...);
> +	...>
> +}
> +
> +@rp depends on patch@
> +identifier show, dev, attr, buf;
> +@@
> +
> +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	<...
> +	return
> +-		snprintf
> ++		scnprintf
> +			(...);
> +	...>
> +}
> +
> +@script: python depends on report@
> +p << r.p;
> +@@
> +
> +coccilib.report.print_report(p[0], "WARNING: use scnprintf or sprintf")
> +
> +@script: python depends on org@
> +p << r.p;
> +@@
> +
> +coccilib.org.print_todo(p[0], "WARNING: use scnprintf or sprintf")
> --
> 2.26.2
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
