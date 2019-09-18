Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D4B6D7B
	for <lists+cocci@lfdr.de>; Wed, 18 Sep 2019 22:25:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IKNp8C021694;
	Wed, 18 Sep 2019 22:23:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 193B277AA;
	Wed, 18 Sep 2019 22:23:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 51FDB7796
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 22:23:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IKNmq7001920
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 22:23:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,522,1559512800"; d="scan'208";a="319873138"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 22:23:48 +0200
Date: Wed, 18 Sep 2019 22:23:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: "Richard W.M. Jones" <rjones@redhat.com>
In-Reply-To: <20190918201751.GV3888@redhat.com>
Message-ID: <alpine.DEB.2.21.1909182223330.2753@hadrien>
References: <20190711152116.GA15492@redhat.com>
 <20190917114803.GB15492@redhat.com>
 <alpine.DEB.2.21.1909182110530.2753@hadrien>
 <20190918201751.GV3888@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Sep 2019 22:23:51 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 18 Sep 2019 22:23:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Compiling with OCaml 4.08
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



On Wed, 18 Sep 2019, Richard W.M. Jones wrote:

> On Wed, Sep 18, 2019 at 09:11:46PM +0200, Julia Lawall wrote:
> > The version in github should now compile with 4.08.  If I don't hear any
> > complaints by Friday, I will make a release.
>
> Thanks Julia, I can confirm it builds here with OCaml 4.08.1.

Thanks very much for the confirmation.

julia

>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-top is 'top' for virtual machines.  Tiny program with many
> powerful monitoring features, net stats, disk stats, logging, etc.
> http://people.redhat.com/~rjones/virt-top
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
