Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C336C731
	for <lists+cocci@lfdr.de>; Tue, 27 Apr 2021 15:45:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 13RDiT8c009546;
	Tue, 27 Apr 2021 15:44:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 61DAB77F1;
	Tue, 27 Apr 2021 15:44:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 677C73DD8
 for <cocci@systeme.lip6.fr>; Tue, 27 Apr 2021 15:44:27 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 13RDiQsO023784
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 27 Apr 2021 15:44:26 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AC6bClq7Om2nDflsMnwPXwA7XdLJzesId70hD?=
 =?us-ascii?q?6mlaQ3VuGPCwvcaogfgdyFvQgDEeRHkvlbm7Scu9aFnb8oN45pRUAKe6UGDdyQ?=
 =?us-ascii?q?iVBaxr8IeK+VPdMgLk8Oo178pdWoxfLPG1MlRgl8b952CDc+oI5NWc6qiniaP/?=
 =?us-ascii?q?4h5WIj1CUK1r4wdnBgvzKCQfeCB9GZE7GJCAj/AqmxOcfx0sBfiTOmMIRKzqqd?=
 =?us-ascii?q?HNifvdACI7Ow=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,254,1613430000"; d="scan'208";a="379815543"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 15:44:25 +0200
Date: Tue, 27 Apr 2021 15:44:25 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Johan Hovold <johan@kernel.org>
In-Reply-To: <YIgPNRiaz2Jup+PT@hovoldconsulting.com>
Message-ID: <alpine.DEB.2.22.394.2104271542170.5173@hadrien>
References: <20210426185404.2466195-1-Julia.Lawall@inria.fr>
 <YIgPNRiaz2Jup+PT@hovoldconsulting.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 27 Apr 2021 15:44:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 27 Apr 2021 15:44:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        kernel-janitors@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] coccinelle: api: semantic patch to use
 pm_runtime_resume_and_get
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



On Tue, 27 Apr 2021, Johan Hovold wrote:

> On Mon, Apr 26, 2021 at 08:54:04PM +0200, Julia Lawall wrote:
> > pm_runtime_get_sync keeps a reference count on failure, which can lead
> > to leaks.  pm_runtime_resume_and_get drops the reference count in the
> > failure case.  This rule very conservatively follows the definition of
> > pm_runtime_resume_and_get to address the cases where the reference
> > count is unlikely to be needed in the failure case.
> >
> > pm_runtime_resume_and_get was introduced in
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to
> > deal with usage counter")
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> As I've said elsewhere, not sure trying to do a mass conversion of this
> is a good idea. People may not be used to the interface, but it is
> consistent and has its use. The recent flurry of conversions show that
> those also risk introducing new bugs in code that is currently tested
> and correct.

I looked some of the patches you commented on, and this rule would not
have transformed those cases.  This rule is very restricted to ensure that
the transformed code follows the behavior of the new function.

>
> By giving the script kiddies another toy like this, the influx of broken
> patches is just bound to increase.
>
> Would also be good to CC the PM maintainer on this issue.

Sure, I can resend with Rafael in CC.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
