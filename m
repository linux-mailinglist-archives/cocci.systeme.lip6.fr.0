Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 913FB23A3DE
	for <lists+cocci@lfdr.de>; Mon,  3 Aug 2020 14:13:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 073CCpi0018510;
	Mon, 3 Aug 2020 14:12:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 62DA177BC;
	Mon,  3 Aug 2020 14:12:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9AE8E41F5
 for <cocci@systeme.lip6.fr>; Mon,  3 Aug 2020 14:12:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 073CCkij024109
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 3 Aug 2020 14:12:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,430,1589234400"; d="scan'208";a="355856872"
Received: from clt-128-93-177-162.vpn.inria.fr ([128.93.177.162])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 14:12:46 +0200
Date: Mon, 3 Aug 2020 14:12:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <8171ffcd-9f60-26a8-3c6a-4356297a12d1@linux.com>
Message-ID: <alpine.DEB.2.22.394.2008031410490.27678@hadrien>
References: <20200605204237.85055-1-efremov@linux.com>
 <20200731210026.7186-1-efremov@linux.com>
 <8171ffcd-9f60-26a8-3c6a-4356297a12d1@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 03 Aug 2020 14:12:52 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 03 Aug 2020 14:12:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v6] coccinelle: api: add kvfree script
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



On Mon, 3 Aug 2020, Denis Efremov wrote:

> Is there a difference from cocci point of view between:
>
> ... when != !is_vmalloc_addr(E)

This will only reject cases where the ! is present.  Coccinelle doesn't
apply isomorphisms to the C source code, so it doesn't detect that eg

if (A)
  B
else C

could be rewritten as

if (!A)
  C
ese B

So when != !A would only match when the code is in the second form.
>
> and
>
> ... when != is_vmalloc_addr(E)
>
> Should the latter one be used in most cases?

This matches both a call to is_vmalloc_addr and a negated call, so it is
more general.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
