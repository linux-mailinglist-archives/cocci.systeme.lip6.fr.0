Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 378252C9EA5
	for <lists+cocci@lfdr.de>; Tue,  1 Dec 2020 11:07:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0B1A6GE2004586;
	Tue, 1 Dec 2020 11:06:16 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7DEC477CD;
	Tue,  1 Dec 2020 11:06:16 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5DCF436AA
 for <cocci@systeme.lip6.fr>; Tue,  1 Dec 2020 11:06:14 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0B1A6EVq016066
 for <cocci@systeme.lip6.fr>; Tue, 1 Dec 2020 11:06:14 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,384,1599516000"; d="scan'208";a="366172839"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 11:06:13 +0100
Date: Tue, 1 Dec 2020 11:06:13 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ira Weiny <ira.weiny@intel.com>
In-Reply-To: <20201130210624.GR1161629@iweiny-DESK2.sc.intel.com>
Message-ID: <alpine.DEB.2.22.394.2012011105330.2666@hadrien>
References: <20201128054145.GP1161629@iweiny-DESK2.sc.intel.com>
 <alpine.DEB.2.22.394.2011280849310.2725@hadrien>
 <20201130191904.GQ1161629@iweiny-DESK2.sc.intel.com>
 <alpine.DEB.2.22.394.2011302051210.2758@hadrien>
 <20201130210624.GR1161629@iweiny-DESK2.sc.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 01 Dec 2020 11:06:18 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 01 Dec 2020 11:06:14 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Itterating matches
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

> But the kaddr in check_compressed_csum() is used?
>
>  148         char *kaddr;
>  149         u8 csum[BTRFS_CSUM_SIZE];
>  150         struct compressed_bio *cb = bio->bi_private;
>  151         u8 *cb_sum = cb->sums;
>  152
>  153         if (inode->flags & BTRFS_INODE_NODATASUM)
>  154                 return 0;
>  155
>  156         shash->tfm = fs_info->csum_shash;
>  157
>  158         for (i = 0; i < cb->nr_pages; i++) {
>  159                 page = cb->compressed_pages[i];
>  160
>  161                 kaddr = kmap_atomic(page);
>  162                 crypto_shash_digest(shash, kaddr, PAGE_SIZE, csum);
>  163                 kunmap_atomic(kaddr);
>
> It correctly leaves this kmap_atomic alone for me.

OK, that's strange.  I will take a look.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
